<# # Create a script that takes one parameter: foldername. 
# Check if the given folder exist. 
# If the folder exist: show how many files are in the folder 
# and then list the files of the folder. 
# If the folder does not exist, the script will show a message: 
# "Sorry, {foldername} does not exist.". #>

$foldername = $Args[0]

if (Test-Path $foldername)
{ 
  $files = Get-ChildItem -Path $foldername

  Write-Host "$($files.Count) files in the folder $foldername"

  $files | Format-Table -Property Name
}
else 
  { Write-Host "Sorry, ${foldername} does not exist." }