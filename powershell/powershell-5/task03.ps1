<# 5.3
[x] Create a script that creates new localusers by a given csv-file. 
[x] The script has one parameter filename. 
[x] Check first that the given file exist, 
[ ] then read all lines and create a new local user account for every user in file. 
[x] The account name is created same way as in the task 01. 
[x] You can use in this script the parameter NoPassword 

Please remember: you have to run this script with Administrator privileges that you can use the `New-LocalUser` cmdlet. 

If the given file does not exist, the script gives a proper error message.

# CSV
# Firstname,Lastname
# Jack,Russell
# Anna,Bella
# Nicke,Nackerstrom
#>

param(
  [Parameter(Mandatory,
  HelpMessage="Enter the path for a CSV file that has first and last names. For example: /home/user/users.csv")]
  [string]$Filename = '' # path to CSV file containing names
)

$accounts = @()

if ($PSBoundParameters.Count -eq 0) {
  Write-host "You need to provide a filename."
  Write-Host "Example usage: ./task03.ps1 -Filename 'users.csv'"
} else {
  if (Test-Path $Filename) {
    # Import names from CSV and loop over them
    Import-Csv $Filename | ForEach-Object {
      $firstname = $_.Firstname
      $lastname = $_.Lastname
      $username = "$($lastname.Substring(0,4))$($firstname.Substring(0,2))".ToLower()

      # Figure out which accounts should be cerated by confirming with the script runner
      $consent = Read-Host "A new local account ${username} will be created for $firstname $lastname, [Yes/No]"

      if (($consent.ToLower() -eq 'Yes') -Or ($consent.ToLower() -eq 'Y')) {
        $accounts += $username
      }

      # Create new users
      foreach ($user in $accounts) {
        <# $user is the current item #>
        New-LocalUser -Name $user -NoPassword
      }

      Write-Host "$($accounts.Count) new accounts were created successfully"
    }
  } else {
    Write-Host "Sorry, ${Filename} does not exist."
  }
}


# Write-Host "PSBoundParameters.Count: $($PSBoundParameters.Count)" # int
# Write-Host "Args.Count: $($Args.Count)" # int