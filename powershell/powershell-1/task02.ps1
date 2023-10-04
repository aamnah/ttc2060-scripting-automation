# Task 02
# Ask from a user his/her firstname, lastname and groupcode. Save them to variables. After that show the following info in console.

$firstname = Read-Host 'Please, give your firstname'
$lastname = Read-Host 'Please, give your lastname'
$groupcode = Read-Host 'Please, give your groupcode'

Write-Host 'Welcome to course:' $firstname $lastname $groupcode

# NOTES
# Read-Host automatically adds a `:` and space at the end 