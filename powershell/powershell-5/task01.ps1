<# 5.1
Create a script that creates new accounts for a placebo system (placebo means here that the system not really exists). The script takes one parameter filename. 
  The parameter points to a csv file including user names. 
Check first that the given file exist, then read all lines. 
User's account is created by taking 
  first four characters of lastname and 
  two characters of firstname. 
  The account contains only lowercase letters. 
Give a message presented in the picture below. 
If the given file does not exist, the script will show an error message. 

CSV file, create 4 new users in 'placebo' system
#>

param(
  [string]$Filename = '' # expects the path and filename of a CSV file including user names
)

$accounts = @() # List of accounts (usernames) to create

if (Test-Path $Filename) {
  Import-Csv $Filename | ForEach-Object {
    # Create usernames (first 4 alphabets of last name, first 2 of firstname, lowercase)
    $firstname = $_.Firstname 
    $lastname = $_.Lastname
    $username = "$($lastname.Substring(0, 4))$($firstname.Substring(0,2))".ToLower()

    # Log the new usernames
    Write-Host "Hello my colleague $firstname $lastname, this is your new account:"
    Write-host $username

    # Add the username to the array of users we need to create
    $accounts += $username

    # Create the user accounts
  } 

  Write-Host "$($accounts.Count) account were created successfully."
} else {
  Write-Host "File does not exist" 
}

# CSV
# Firstname,Lastname
# Jack,Russell
# Anna,Bella
# Nicke,Nackerstrom