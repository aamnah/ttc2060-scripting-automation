# Task 05
# PowerShell includes many kind of commands: alias, cmdlets, function and application. 
# Create a script that counts how many application PowerShell returns.
$numberOfApplications = (Get-Command -CommandType Application | Measure-Object).Count

Write-Host "You got $numberOfApplications applications in Powershell"