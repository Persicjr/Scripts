#Import-Module ActiveDirectory

$joinCred = New-Object System.Management.Automation.PSCredential ("RangeControl",$(ConvertTo-SecureString -AsPlainText -Force "R@ng3P@`$`$w0rd!!"))

Add-Computer -Domain "cityofmittelberg.gov" -Credential $joinCred -Force

# Disable the Windows Firewall in the registry
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" -Name "EnableFirewall" -Value 0
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" -Name "EnableFirewall" -Value 0
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" -Name "EnableFirewall" -Value 0

# Verify the status of the Windows Firewall
$firewallStatus = Get-NetFirewallProfile | Select-Object Name, Enabled
$firewallStatus

shutdown /r
