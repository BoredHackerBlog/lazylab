echo Stopping updates
sc config wuauserv start= disabled
net stop wuauserv

echo Disabling firewall
netsh advfirewall set allprofiles state off
