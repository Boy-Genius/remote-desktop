

net session >nul 2>&1
if %errorLevel% == 0 (
    echo admin!
) else (
    goto UACPrompt
)

set /p IP=Insert IP:
set /p USER=Insert Username:
set /p PASS=Insert Password:
cmdkey /generic:TERMSRV/%IP% /user:%USER% /pass:%PASS%

REM -----Disables "always ask for password"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /f /v fPromptForPassword /t REG_DWORD /d 0

REM -----Disables certificate warning
reg add "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client" /f /v AuthenticationLevelOverride /t REG_DWORD /d 0

:keepalive
mstsc /v:%IP%
goto keepalive


:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B