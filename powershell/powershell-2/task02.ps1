# TASK 2
# Create a script that counts how many files and folders are in given folder. 
# The script shows the name of the folder and the number of the files.
$folderLocation = Read-Host 'Please, give the folder to search'
$fileCount = (Get-ChildItem -Path $folderLocation).Count

Write-Host "$fileCount files found at $folderLocation"