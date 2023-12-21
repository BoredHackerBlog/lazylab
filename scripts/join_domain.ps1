$newDNSServers = "192.168.200.11"
$adapters = Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object {$_.IPAddress -match "192.168.200."}
$adapters | ForEach-Object {$_.SetDNSServerSearchOrder($newDNSServers)}

$PlainPassword = "Passw0rd!"
$SecurePassword = $PlainPassword | ConvertTo-SecureString -AsPlainText -Force

$DomainCred = New-Object System.Management.Automation.PSCredential "LazyLab.local\Administrator", $SecurePassword

Add-Computer -DomainName "LazyLab.local" -credential $DomainCred

net localgroup Administrators LazyLab.local\dwight /add
net localgroup Administrators LazyLab.local\jim /add
net localgroup Administrators LazyLab.local\pam /add