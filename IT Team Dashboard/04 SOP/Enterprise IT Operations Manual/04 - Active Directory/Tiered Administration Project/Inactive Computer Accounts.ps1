<#
.SYNOPSIS
    Enterprise Inactive Computer Accounts Handler.
.DESCRIPTION
    Script quét, xuất báo cáo, di chuyển và disable các tài khoản máy tính quá 90 ngày không xác thực.
.NOTES
    Enterprise Security Standard: Defense-in-Depth, Tiered Administration Framework.
#>

[CmdletBinding()]
param (
    [int]$DaysInactive = 90,
    [string]$TargetOUPath = "OU=Computers_Disabled,DC=qve,DC=com", 
    [string]$LogFilePath = "C:\AD_Logs\Stale_Computers_$(Get-Date -Format 'yyyyMMdd_HHmmss').log",
    [string]$ExportCsvPath = "C:\AD_Logs\Stale_Computers_$(Get-Date -Format 'yyyyMMdd_HHmmss').csv",
    # $ExecuteChanges = $false: CHẠY THỬ (Dry-Run). Đổi $true khi xác nhận thực thi thật.
    [bool]$ExecuteChanges = $false
)

# 1. BƯỚC SỬA LỖI CORE: Tính toán FileTime dưới dạng Int64 trước khi truyền vào Filter
$CutoffDate = (Get-Date).AddDays(-$DaysInactive)
$CutoffFileTime = $CutoffDate.ToFileTime()

# Các OU bảo vệ (Cấm đụng tới)
$ExcludedOUs = @(
    "OU=Domain Controllers,DC=qve,DC=com",
    "OU=Servers,DC=qve,DC=com",
    "OU=Computers_Disabled,DC=qve,DC=com"
)

# Tạo thư mục lưu Log nếu chưa tồn tại
$LogDir = Split-Path $LogFilePath
if (-not (Test-Path $LogDir)) { New-Item -ItemType Directory -Path $LogDir -Force | Out-Null }

function Write-Log {
    param ([string]$Message, [string]$Level = "INFO")
    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $LogLine = "[$TimeStamp] [$Level] $Message"
    Write-Host $LogLine -ForegroundColor $(if ($Level -eq "ERROR") { "Red" } elseif ($Level -eq "WARNING") { "Yellow" } else { "Green" })
    Add-Content -Path $LogFilePath -Value $LogLine
}

Write-Log "=== BẮT ĐẦU QUY TRÌNH QUẢN LÝ TÀI KHOẢN MÁY TÍNH INACTIVE (> $DaysInactive NGÀY) ==="
Write-Log "Mốc thời gian kiểm tra (Cutoff Date): $($CutoffDate.ToString('dd/MM/yyyy HH:mm:ss'))"
Write-Log "Giá trị FileTime tương ứng: $CutoffFileTime"

# 2. KIỂM TRA OU ĐÍCH
try {
    $TargetOU = Get-ADOrganizationalUnit -Identity $TargetOUPath -ErrorAction Stop
    Write-Log "Đã xác nhận OU đích tồn tại: $($TargetOU.DistinguishedName)"
} catch {
    Write-Log "LỖI CRITICAL: Không tìm thấy OU '$TargetOUPath'. Dừng chương trình!" "ERROR"
    exit
}

# 3. TRUY VẤN MÁY TÍNH INACTIVE (Cú pháp Filter dạng String đã chuẩn hóa)
Write-Log "Đang truy vấn Active Directory..."

try {
    # Sử dụng String Filter để tránh lỗi ép kiểu .NET
    $FilterString = "LastLogonTimeStamp -lt $CutoffFileTime -and Enabled -eq '$true' -and OperatingSystem -notlike '*Server*'"
    
    $InactiveComputers = Get-ADComputer -Filter $FilterString -Properties Name, LastLogonTimeStamp, PasswordLastSet, OperatingSystem, DistinguishedName -ErrorAction Stop
    Write-Log "Phát hiện $($InactiveComputers.Count) máy tính thỏa mãn điều kiện inactive."
} catch {
    Write-Log "Lỗi khi truy vấn Get-ADComputer: $($_.Exception.Message)" "ERROR"
    exit
}

$ReportData = @()

# 4. XỬ LÝ LỌC OU VÀ THỰC THI
foreach ($Computer in $InactiveComputers) {
    # Kiểm tra máy tính có thuộc OU bị loại trừ không
    $IsExcluded = $false
    foreach ($ExcludedOU in $ExcludedOUs) {
        if ($Computer.DistinguishedName -like "*$ExcludedOU") {
            $IsExcluded = $true
            break
        }
    }

    if ($IsExcluded) {
        Write-Log "Bỏ qua PC nằm trong OU bảo vệ: $($Computer.Name) ($($Computer.DistinguishedName))" "WARNING"
        continue
    }

    $LastLogonDate = if ($Computer.LastLogonTimeStamp) { [DateTime]::FromFileTime($Computer.LastLogonTimeStamp) } else { "N/A" }
    
    $ReportData += [PSCustomObject]@{
        ComputerName      = $Computer.Name
        OperatingSystem   = $Computer.OperatingSystem
        LastLogonDate     = $LastLogonDate
        CurrentLocation   = $Computer.DistinguishedName
        ActionStatus      = if ($ExecuteChanges) { "Moved & Disabled" } else { "Pending Review (Dry-Run)" }
    }

    if ($ExecuteChanges) {
        try {
            # Di chuyển máy tính về OU cách ly
            Move-ADObject -Identity $Computer.DistinguishedName -TargetPath $TargetOU.DistinguishedName -ErrorAction Stop
            Write-Log "SUCCESS: Đã MOVE [$($Computer.Name)] sang OU [$TargetOUPath]" "INFO"

            # Vô hiệu hóa tài khoản máy tính
            Disable-ADAccount -Identity $Computer.DistinguishedName -Confirm:$false -ErrorAction Stop
            Write-Log "SUCCESS: Đã DISABLE tài khoản máy tính [$($Computer.Name)]" "INFO"

        } catch {
            Write-Log "LỖI khi xử lý máy tính [$($Computer.Name)]: $($_.Exception.Message)" "ERROR"
        }
    } else {
        Write-Log "[DRY-RUN] Phát hiện PC inactive: $($Computer.Name) | Logon cuối: $LastLogonDate | Vị trí: $($Computer.DistinguishedName)" "INFO"
    }
}

# 5. XUẤT BÁO CÁO CSV
if ($ReportData.Count -gt 0) {
    $ReportData | Export-Csv -Path $ExportCsvPath -NoTypeInformation -Encoding UTF8
    Write-Log "Đã xuất báo cáo chi tiết ra file CSV tại: $ExportCsvPath"
} else {
    Write-Log "Không có máy tính nào cần xử lý trong đợt này."
}

Write-Log "=== HOÀN THÀNH QUY TRÌNH ==="