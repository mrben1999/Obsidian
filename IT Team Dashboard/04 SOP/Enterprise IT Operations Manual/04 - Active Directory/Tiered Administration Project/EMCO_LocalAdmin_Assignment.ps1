# ==============================================================================
# Script: Create-EMCOServiceAccount.ps1
# Description: Creates a dedicated Tier 2 Service Account for EMCO Deployment
# Domain: DC=qve,DC=com
# ==============================================================================

Import-Module ActiveDirectory

$DomainDN = (Get-ADDomain).DistinguishedName

# 1. Xác định OU chứa tài khoản Admin/Service (Dựa trên Tiering Model của bạn)
$TargetOU = "OU=Tier2-WorkstationAdmins,OU=Admin Accounts,$DomainDN"

# 2. Tạo Global Security Group chứa quyền Local Admin cho Workstations
$GroupName = "GG_Tier2_EMCO_LocalAdmins"
if (-not (Get-ADGroup -Filter "Name -eq '$GroupName'")) {
    New-ADGroup -Name $GroupName `
                -GroupScope Global `
                -GroupCategory Security `
                -Path $TargetOU `
                -Description "Group cap quyen Local Admin cho EMCO Installer tren Workstations"
    Write-Host "[✔] Da tao Group: $GroupName" -ForegroundColor Green
}

# 3. Tạo Service Account cho EMCO
$AccountName = "svc.emco.deploy"
if (-not (Get-ADUser -Filter "SamAccountName -eq '$AccountName'")) {
    $Password = Read-Host -AsSecureString -Prompt "Nhap mat khau phuc tap cho $AccountName"
    
    New-ADUser -Name "SVC - EMCO Remote Installer" `
               -SamAccountName $AccountName `
               -UserPrincipalName "$AccountName@qve.com" `
               -Path $TargetOU `
               -AccountPassword $Password `
               -Enabled $true `
               -PasswordNeverExpires $true `
               -CannotChangePassword $true `
               -Description "Service Account chay EMCO Deploy software xuong Client - KHONG GAN DOMAIN ADMIN"
               
    Write-Host "[✔] Da tao Service Account: $AccountName" -ForegroundColor Green
    
    # Add tài khoản vào Group
    Add-ADGroupMember -Identity $GroupName -Members $AccountName
    Write-Host "[✔] Da add $AccountName tao nhom $GroupName" -ForegroundColor Green
}