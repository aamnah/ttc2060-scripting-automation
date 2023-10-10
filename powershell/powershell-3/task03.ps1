<# 
Create a script that takes two parameters: foldername and filename. Check first if the given file is in the given folder. If the file exists, show a proper message. If it does not exist, ask from a user "Create the file {filename}? Yes/No". If the user returns "Yes", create the file to the folder.

Endless loop
If empty, jump out of the loop
#>

param(
  [string]$file = '',
  [string]$folder = ''
)

$filepath = Join-Path -Path $folder -ChildPath $file
if (Test-Path $folder) {
  if (Test-Path $filepath) {
    Write-Host "The file you are looking for exists in ${folder}"
  } else {
    # offer to create the file
    $consent = Read-Host "Create the file {filename}? Yes/No"

    if ($consent -eq 'Yes' -Or $consent -eq 'Y' -Or $consent -eq 'y') {
      # they want it, create the file
      New-Item -Path $filepath -ItemType File
    } 
  }
} else {
  Write-Host "$folder does not exist"
}