# TASK 1
# Create a script that writes current logged username and current date to console.
$loggedInUser = '' 
$dateToday = Get-Date -Format d

Write-Host 'Logged username is' $loggedInUser 'and today is' $dateToday