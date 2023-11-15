<# Create a function named Get-FiluInfo2 that shows Name, Length, LastWriteTime properties of files with given extension in user's home folder. The extension is like .txt or .csv, and it has been given as a parameter. Run the function to prove that it works. #>

param(
  [string]$Extension = '',
  [string]$Folder = ${HOME}
)
function Get-FileInfo {
  Get-ChildItem -File -Path ${Folder} -Filter "*${Extension}" | Format-Table -Property Name, Length, LastWriteTime
}

Get-FileInfo