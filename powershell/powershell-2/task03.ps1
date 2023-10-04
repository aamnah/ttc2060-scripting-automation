<# 
# TASK 3
# Create a script that takes three parameters, the type of the parameters is string. 
# The script order the given strings by string length. 
# Test your script at least with four different test runs, like in the picture. 
#>

# script takes three named arguments
# arguments have default values if they are not given
param (
  [string]$first = 'firstArg',
  [string]$second = 'secondArg',
  [string]$third = 'thirdArg'
)

$ParameterList = $first, $second, $third

Write-Host "Parameters are: $first $second $third"
Write-Host "Your ordered words are: $($ParameterList | Sort-Object -Property Length)"