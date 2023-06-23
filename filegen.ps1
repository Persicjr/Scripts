$extensions = @(".txt", ".docx", ".xlsx", ".jpg", ".png", ".pptx") # List of file extensions to choose from

$minSize = 1 # Minimum file size in kilobytes
$maxSize = 1000 # Maximum file size in kilobytes

$numberOfFiles = 5 # Number of files to generate

$destinationPath = "C:\Files" # Destination folder to save the generated files

# Generate random file name
function Get-RandomFileName {
    $characters = "abcdefghijklmnopqrstuvwxyz0123456789"
    $randomName = ""
    $length = Get-Random -Minimum 5 -Maximum 10

    for ($i = 1; $i -le $length; $i++) {
        $randomName += $characters[(Get-Random -Minimum 0 -Maximum $characters.Length)]
    }

    return $randomName
}

# Generate random file size in kilobytes
function Get-RandomFileSize {
    return Get-Random -Minimum $minSize -Maximum $maxSize
}

# Generate random files
for ($i = 1; $i -le $numberOfFiles; $i++) {
    $extension = $extensions | Get-Random
    $fileName = Get-RandomFileName
    $fileSize = Get-RandomFileSize
    $filePath = Join-Path -Path $destinationPath -ChildPath "$fileName$extension"

    # Generate file content with random data
    $content = [byte[]]::new($fileSize * 1024)
    (Get-Random -Minimum 0 -Maximum 256) * $content.Length | % { $content[$_] = Get-Random -Minimum 0 -Maximum 256 }

    # Write content to file
    [System.IO.File]::WriteAllBytes($filePath, $content)

    Write-Host "Generated file: $filePath"
}
