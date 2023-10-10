<# 
Create a script that takes three parameters: foldername, filename and number. Check first if the given folder, exists. If not, create the folder. After that create as many new files as the number argument says to the folder. Finally return a report how many files has been created, and list the names of the files.

loops in PowerShell
#>

param(
  [string]$file = '',
  [string]$folder = '',
  [int]$number = 1
)

if (-Not(Test-Path $folder)) {
  # create the folder
  New-Item -Path $folder -ItemType Directory

  # create as many new files as the number argument says to the folder. 
  for ($i = 1; $i -le $number; $i++) {
    New-Item -Path $folder -ItemType File -Name "file${i}.txt"
  }

  # Finally return a report how many files have been created, and list the names of the files.
  Write-Host "`n${number} files have been created"
  Get-ChildItem -Path $folder | Format-Table -Property Name
} else {
  Write-Host "Folder already exists. Exiting.."
  exit
}