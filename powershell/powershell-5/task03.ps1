<# 5.3
[ ] Create a script that creates new localusers by a given csv-file. 
[ ] The script has one parameter filename. 
[ ] Check first that the given file exist, 
[ ] then read all lines and create a new local user account for every user in file. 
[ ] The account name is created same way as in the task 01. 
[ ] You can use in this script the parameter NoPassword 

Please remember: you have to run this script with Administrator privileges that you can use the New-LocalUser cmdlet. 

If the given file does not exist, the script gives a proper error message.
#>

param(
  [string]$Filename = '' # path to CSV file containing names
)

if ($PSBoundParameters -eq 0) {
  Write-host "You need to provide a filename."
  Write-Host "Example usage: ./task03.ps1 -Filename 'users.csv'"
} else {
  if (Test-Path $Filename) {
    # Do what needs doing
  } else {
    Write-Host "Sorry, ${Filename} does not exist."
  }
}