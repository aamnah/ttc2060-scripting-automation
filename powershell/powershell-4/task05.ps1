<# 
Task 4.5
Create a script that takes one parameter: foldername. 
First check that the given folder exist, 
  then write all names of files in the folder to a text file named files.txt. 
  Create the file to user's home folder. 
If the folder does not exist, 
  the script will show a message: "Sorry, {foldername} does not exist." #>

param(
  [string]$foldername = ''
)

$filename = 'files.txt'
$filepath = Join-Path -Path ${HOME} -ChildPath ${filename}

# See if the provided folder exists
if (Test-Path $foldername) {
  # Create a new file in the home directory called files.txt
  New-Item -Path ${filepath} -ItemType File

  # List the files in the provided folder and add them to the file we just created
  Get-ChildItem -Path ${foldername} -Name | Add-Content ${filepath}
} else {
  Write-Host "Sorry, ${foldername} does not exist."
}