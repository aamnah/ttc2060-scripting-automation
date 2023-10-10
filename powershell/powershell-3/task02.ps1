<# 
Create a script that takes two parameters: foldername and filename. 
Check first if the given folder exist. 
If the folder exists, check if the file exists in the folder. 
If true, show a proper message. 
If it does not exist, show a message: 
"Sorry, {filename} in the {foldername} does not exist.". 
#>
param (
  [string]$folder = '',
  [string]$file = ''
)

$filepath = Join-Path -Path $folder -ChildPath $file

if (Test-Path $folder)
{
  if (Test-Path $filepath) {
    Write-Host "The file you are looking for exists in ${folder}"
  } else {
    Write-Host "Sorry, ${file} in ${folder} does not exist."
  }
} else {
  Write-Host "${folder} does not exist"
}