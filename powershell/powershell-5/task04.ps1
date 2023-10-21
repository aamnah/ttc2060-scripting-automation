<# 5.4
[x] Create a script that writes information of all the local users in a computer to a CSV-file. 
[x] The script has one parameter filename. 
[x] The information includes local users's
 [x] 1) name 
 [x] 2) full name 
 [x] 3) SID and 
 [x] 4) lastlogon. 
#>

param(
  [Parameter(Mandatory,
  HelpMessage = "Provide the file to save local user details in. For example: /home/user/localusers.csv")]
  [string]$Filename = ''
)

function Export-LocalUser() {
  param(
    [string[]]$Properties = ('Name', 'FullName', 'SID', 'LastLogon'),
    [string]$OutFile = 'localusers.csv'
  )
  Get-LocalUser | Select-Object $Properties | Export-Csv -Path $OutFile
}

if (Test-Path $Filename) {
  # The default behavior of `Export-Csv` is to overwrite any existing files. Caution about this.
  $consent = Read-Host "$Filename already exists. Do you want to overwrite? [Yes/No]"

  if (($consent.ToLower() -eq 'yes') -Or ($consent.ToLower() -eq 'y')) {
    Export-LocalUser -OutFile $Filename
  }
} else {
  Export-LocalUser -OutFile $Filename
}


# NOTES
# Find what you can get from Get-LocalUser with
# Get-LocalUser | Get-Member
# Get-LocalUser | Select-Object Name, FullName, SID, LastLogon

# The default beahavior of `Export-Csv` is to:
  # creates a new file if one doesn't exist,
  # overwrites an existing file without confirmation