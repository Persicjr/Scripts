# Set the script path
$scriptPath = "C:\Users\rangecontrol\Documents\join.ps1"

# Set the admin credentials
$username = "rangecontrol"
$password = ConvertTo-SecureString "R@ng3P@$$w0rd!!" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username, $password)

# Run the script as an administrator
Start-Process powershell.exe -Credential $credential -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`"" -Verb RunAs

# Wait for the script to complete (adjust the timeout if needed)
Start-Sleep -Seconds 10

# Delete the script file
Remove-Item -Path $scriptPath -Force

# Empty the recycle bin
$shell = New-Object -ComObject Shell.Application
$recycleBin = $shell.NameSpace(0xa)
$recycleBin.Items() | ForEach-Object { $shell.Namespace(0xa).ParseName($_.Name).InvokeVerb("delete") }
