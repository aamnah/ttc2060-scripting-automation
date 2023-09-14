# TASK 03
# Ask two integers from a user, and return addition, subtraction, multiplication and division of numbers.

$value1 = Read-Host 'Give the first integer'
$value1 = [int]$value1
$value2 = Read-Host 'Give the second integer'
$value2 = [int]$value2

$sum = $value1 + $value2
$subtract = $value1 - $value2
$multiply = $value1 * $value2
$divide = $value1 / $value2

Write-Host "Sum is $sum"
Write-Host "Subtraction is $subtract"
Write-Host "Multiplication is $multiply"
Write-Host "Division is $divide"
