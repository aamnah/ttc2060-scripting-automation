<# 
Create a script that takes two parameters: foldername and newname. Check first if the given folder, exists. If not, show a proper message and quit the script. If the folder exist, count files in the folder, and ask from a user: "All {number} files will be renamed with name {newname}. Yes/No". If the user returns "Yes", rename all files in the folder.
#>

param(
  [string]$folder = '',
  [string]$newname = ''
)

if (-Not(Test-Path $folder)) {
  Write-Host "The folder does not exist"
  exit
} else {
  $files = Get-ChildItem -Path $folder
  Write-Host "You have $($files.Count) files in ${folder}"
  $consent = Read-Host "All $($files.Count) files will be renamed with name ${newname}. Yes/No".

  if ($consent -eq 'Yes' -Or $consent -eq 'Y' -Or $consent -eq 'y') {
    foreach ($file in $files) {
      $index = $files.IndexOf($file)
      Rename-Item -Path $file -NewName "${newname}${index}"
    }
    # List the renamed files
    Get-ChildItem -Path $folder | Format-Table -Property Name
  }
}