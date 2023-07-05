#Import-Module ActiveDirectory

$joinCred = New-Object System.Management.Automation.PSCredential ("RangeControl",$(ConvertTo-SecureString -AsPlainText -Force "R@ng3P@`$`$w0rd!!"))

Add-Computer -Domain "cityofmittelberg.gov" -Credential $joinCred -Force
