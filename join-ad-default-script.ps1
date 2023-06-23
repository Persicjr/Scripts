#Import-Module ActiveDirectory

$joinCred = New-Object System.Management.Automation.PSCredential ("RangeControl",$(ConvertTo-SecureString -AsPlainText -Force "R@ng3P@`$`$w0rd!!"))

Add-Computer -Domain "MiddleCityOhio.gov" -Credential $joinCred -Force