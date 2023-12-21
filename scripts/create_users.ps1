Import-Module ActiveDirectory

New-ADUser -Name 'Mike Scott' -SAMAccountName mscott -AccountPassword (ConvertTo-SecureString Password123 -AsPlainText -Force) -Description "Manager" -Enabled:$true
New-ADUser -Name 'Jim' -SAMAccountName jim -AccountPassword (ConvertTo-SecureString 123Password -AsPlainText -Force) -Description "jim - IT dept" -Enabled:$true
New-ADUser -Name 'Pam' -SAMAccountName pam -AccountPassword (ConvertTo-SecureString 123Password123 -AsPlainText -Force) -Description "pam - IT dept" -Enabled:$true
New-ADUser -Name 'Dwight' -SAMAccountName dwight -AccountPassword (ConvertTo-SecureString Beets12345 -AsPlainText -Force) -Description "Dwight - sales dept" -Enabled:$true

New-ADUser -Name 'SQL Service' -SAMAccountName SQLService -AccountPassword (ConvertTo-SecureString Password1 -AsPlainText -Force) -Description "account for database stuff" -Enabled:$true

Add-ADGroupMember -Identity "Domain Admins" -Members mscott
Add-ADGroupMember -Identity "Administrators" -Members mscott, jim, pam

setspn -a dc1/SQLService.LazyLab.local:60111 LazyLab\SQLService
setspn -t LazyLab.local -Q */*