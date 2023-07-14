$sourceFolder = "C:/Users/rangecontrol/Downloads/ghosts-client-x64-v7.0.0"
$destinationFolder = "C:/Destination/Folder"  # Change this to the desired destination folder on the remote computers

$computers = @(
    "computer1",
    "computer2",
    "computer3"
    # Add more computer names here
)

foreach ($computer in $computers) {
    try {
        $session = New-PSSession -ComputerName $computer -Credential (Get-Credential)  # Enter your domain admin credentials when prompted
        Copy-Item -Path $sourceFolder -Destination $destinationFolder -Recurse -ToSession $session -ErrorAction Stop
        Write-Host "Successfully copied folder to $computer"
        Remove-PSSession -Session $session
    } catch {
        Write-Host "Failed to copy folder to $computer. Error: $_"
    }
}
