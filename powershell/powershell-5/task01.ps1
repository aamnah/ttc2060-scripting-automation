<# 5.1
[x] Create a script that creates new accounts for a placebo system (placebo means here that the system not really exists). 
[x] The script takes one parameter `filename`. The parameter points to a csv file including user names. 
[x] Check first that the given file exist, then read all lines. 
[x] User's account is created by taking 
  [x] first four characters of lastname and 
  [x] two characters of firstname. 
  [x] The account contains only lowercase letters. 
[x] Show a message greeting the user by full name, and telling them their new usernames 
[x] If the given file does not exist, the script will show an error message. 
#>

param(
  [string]$Filename = '' # expects the path and filename of a CSV file including user names
)

$accounts = @() # List of accounts (usernames) to create

if ($PSBounParameters -eq 0) {
  # Script was run without passing any parameters
  Write-Host "You need to provide a filename."
  Write-Host "Example usage: ./task01.ps1 -Filename 'users.csv'"
} else {
  if (Test-Path $Filename) {
    Import-Csv $Filename | ForEach-Object {
      # Create usernames (first 4 alphabets of last name, first 2 of firstname, lowercase)
      $firstname = $_.Firstname 
      $lastname = $_.Lastname
      $username = "$($lastname.Substring(0, 4))$($firstname.Substring(0,2))".ToLower()
  
      # Log the new usernames
      Write-Host "Hello my colleague $firstname $lastname, this is your new account:"
      Write-host $username
      
      # Create the user accounts
      # New-LocalUser -Name $username -NoPassword
  
      # Add the username to the array of users we have created
      $accounts += $username
    } 
    Write-Host "$($accounts.Count) account were created successfully."
  } else {
    # a filename was provided but the file does not exist
    Write-Host "Sorry, ${Filename} does not exist." 
  }
}

# CSV
# Firstname,Lastname
# Jack,Russell
# Anna,Bella
# Nicke,Nackerstrom