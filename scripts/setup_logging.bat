auditpol /Set /subcategory:"Process Creation" /Success:Enable
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit\ /v ProcessCreationIncludeCmdLine_Enabled /t REG_DWORD /d 1

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging" /v EnableModuleLogging /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames" /v * /t REG_SZ /d * /f /reg:64
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" /v EnableScriptBlockLogging /t REG_DWORD /d 00000001 /f /reg:64
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" /v EnableTranscripting /t REG_DWORD /d 00000001 /f /reg:64
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" /v OutputDirectory /t REG_SZ /d C:\PSTranscipts /f /reg:64
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" /v EnableInvocationHeader /t REG_DWORD /d 00000001 /f /reg:64

powershell Invoke-WebRequest -Uri "https://raw.githubusercontent.com/olafhartong/sysmon-modular/master/sysmonconfig.xml" -OutFile "sysmonconfig.xml"
powershell Invoke-WebRequest -Uri "https://live.sysinternals.com/Sysmon.exe" -OutFile "sysmon.exe"
sysmon.exe -accepteula -i sysmonconfig.xml
