<# 
Create a script that ask file names from an user. 
The names are asked until the user gives empty input. 
After that, the script creates the files with given names to user's home folder. 
The script writes the current date and time to the files in the following format 30.9.2021 12.30. 
Finally show a message that how many files were created succesfully. #>

$filenames = @()
$folder = ${HOME}
$user_input = $null

Write-Host "Today is $(Get-Date -Format 'dd.MM.yyy') and time is $(Get-Date -Format 'HH.mm')"

Do {
  $user_input = [string](Read-Host "Give a file name, press Enter to quit")
  $filenames += $user_input
}
Until ($user_input -eq '')

foreach ($file in $filenames) {
  if ($file -ne '') {
    $path = Join-Path -Path ${folder} -ChildPath $file
    New-Item -ItemType File -Path ${path}
    Get-Date -Format "dd.MM.yyy HH.mm" | Add-Content $path
  }
}

# Subtract one for the initial null value for user_input
Write-Host "$($filenames.Count - 1) files were created succesfully."