<# Create a function named Get-FiluInfo that shows Name and Length properties of all files in user's home folder. Run the function to prove that it works. #>

function Get-FileInfo {
  Get-ChildItem -Path ${HOME} | Format-Table -Property Name, Length
}

Get-FileInfo