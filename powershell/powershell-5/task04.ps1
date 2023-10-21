<# 5.4
[x] Create a script that writes information of all the local users in a computer to a CSV-file. 
[x] The script has one parameter filename. 
[x] The information includes local users's
 [x] 1) name 
 [x] 2) full name 
 [x] 3) SID and 
 [x] 4) lastlogon. 

[x] Add EventLog functionality from Task 05 to log success/fail of CSV file creation
#>

param(
  [Parameter(Mandatory,
  HelpMessage = "Provide the file to save local user details in. For example: /home/user/localusers.csv")]
  [string]$Filename = ''
  )

# Source `Add-MyEvent` from Task 5
# Dot source works just like Bash
# . .\task05.ps1
# Join path makes the path cross-platform (\ vs /)
# although it doesn't matter so much in this particular script
# where we are using Windows only functionality (i.e. Get-LocalUser)
. (Join-Path $PSScriptRoot 'task05.ps1')

function Export-LocalUser() {
  param(
    [string[]]$Properties = ('Name', 'FullName', 'SID', 'LastLogon'),
    [string]$OutFile = 'localusers.csv'
  )
  Get-LocalUser | Select-Object $Properties | Export-Csv -Path $OutFile
}

if (Test-Path $Filename) {
  # The default behavior of `Export-Csv` is to overwrite any existing files. 
  # Caution the user about this and ask if overwriting is okay
  $consent = Read-Host "$Filename already exists. Do you want to overwrite? [Yes/No]"

  if (($consent.ToLower() -eq 'yes') -Or ($consent.ToLower() -eq 'y')) {
    Export-LocalUser -OutFile $Filename
    Add-MyEvent -Type Information -Message "CSV file $Filename created successfully."
  } else {
    Add-MyEvent -Type Information -Message "Could not create CSV file: $Filename"
  }
} else {
  # CSV file doesn't exist, create a new one
  Export-LocalUser -OutFile $Filename
  Add-MyEvent -Type Information -Message "CSV file $Filename created successfully."
}


# NOTES
# Find what you can get from Get-LocalUser with
# Get-LocalUser | Get-Member
# Get-LocalUser | Select-Object Name, FullName, SID, LastLogon

# The default beahavior of `Export-Csv` is to:
  # creates a new file if one doesn't exist,
  # overwrites an existing file without confirmation