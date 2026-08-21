@echo off
REM ========================================================
REM SCRIPT TỰ ĐỘNG CÀI ĐẶT ZABBIX AGENT 2 VÀ GLPI AGENT
REM Server Destination: glpi.qve.com
REM ========================================================

SET SHARE_PATH\\qvnshare\QVN_Share\AppShare
REM (Hoặc đổi \\glpi.qve.com\DeployAgent thành đường dẫn UNC thư mục share ở Bước 1)

REM --------------------------------------------------------
REM 1. CÀI ĐẶT ZABBIX AGENT 2 (v7.4.13)
REM --------------------------------------------------------
reg query "HKLM\SOFTWARE\Zabbix Agent 2" >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    msiexec /i "%SHARE_PATH%\zabbix_agent2\zabbix_agent2-7.4.13.msi" /qn SERVER="glpi.qve.com" SERVERACTIVE="glpi.qve.com" HOSTNAME="%COMPUTERNAME%" ENABLEPATH=1 /norestart
)

REM --------------------------------------------------------
REM 2. CÀI ĐẶT GLPI AGENT (v1.18)
REM --------------------------------------------------------
reg query "HKLM\SOFTWARE\GLPI-Agent" >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    msiexec /i "%SHARE_PATH%\Glpi_Agent\GLPI-Agent-1.18-x64.msi" /qn SERVER="http://glpi.qve.com/front/inventory.php" RUNNOW=1 ADD_FIREWALL_EXCEPTION=1 /norestart
)

exit /b 0