<# 5.2
Create a script that opens all the given urls to a browser. 

[x] The script has one parameter `filename`. The parameter points to a text file where urls are. 
[x] Check first that the given file exist, 
  [x] then read all lines and open the urls in a browser. 
[x] If the given file does not exist, the script will show a error message. 
#>

param(
  [string]$Filename = '' # points to a text file containing URLs
)

if ($PSBoundParameters.Count -eq 0) {
  # Script was run without passing any parameters
  Write-Host "You need to provide a filename."
  Write-Host "Example usage: ./task02.ps1 -Filename 'urls.txt'"
} else {
  if (Test-Path $Filename) {
    Get-Content $Filename | ForEach-Object {
      # Open the URL in the default browser
      Start-Process $_
    }
  } else {
    # a filename was provided but the file does not exist
    Write-Host "Sorry, ${Filename} does not exist."
  }
}

# NOTES:
# Write-Host "PSBoundParameters.Count $($PSBoundParameters.Count)"
# Write-Host "Arguments provided: $($Args.Count)"
# Use `$PSBoundParameters.Count` if you're passing parameters to a script, 
# and `$Args.Count` when you are passing parameters to a function inside a script.
# The values for these two can be different.