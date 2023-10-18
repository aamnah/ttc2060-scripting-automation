<# Create a script that ask workstation names from an user. The names are asked until the user gives empty input. After that, the script writes all names to a file in user's home folder. The file name is given with the parameter: filename. Finally show a proper message that the file was created succesfully. Please, read about manipulating arrays #>

param(
  $filename = '',
  $folder = ${HOME},
  $workstations = @(),
  $user_input = $null
)

$path = Join-Path -Path ${folder} -ChildPath ${filename}

# Keep asking for workstation names until empty input is given
Do {
  $user_input = [string](Read-Host "Give a workstation name, press Enter to quit")
  $workstations += $user_input
}
Until ($user_input -eq '')

# Create file in $HOME to add the workstation names to
New-Item -ItemType File -Path ${path}

# Add workstation names to the file
foreach ($name in $workstations) {
  if ($name -ne '') {
    $name | Add-Content $path
  }
}

# Subtract one for the initial null value for user_input
Write-Host "$path was created succesfully."