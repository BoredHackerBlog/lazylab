curl https://live.sysinternals.com/PsExec64.exe --output c:\psexec.exe
SCHTASKS /Create /TN check_ws /SC MINUTE /MO 5 /TR "c:\psexec -accepteula -i \\workstation1 -u lazylab\pam -p 123Password123 cmd.exe /c ping -n 60 127.0.0.1" /RU LazyLab.local\pam /RP 123Password123
