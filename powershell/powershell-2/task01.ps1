<# 
# TASK 1
Create a script that counts how many files are in user's home folder. The script shows the home folder name and the number of the files.
#>
$fileCount = (Get-ChildItem -Path $HOME -File).Count

Write-Host ("$fileCount files found at $HOME")