# PowerShell - Exercise 1

Task 01
---
![Task 02](./task01.png)

Task 02
---

```ps1
$firstname = Read-Host 'Please, give your firstname'
$lastname = Read-Host 'Please, give your lastname'
$groupcode = Read-Host 'Please, give your groupcode'

Write-Host 'Welcome to couurse:' $firstname $lastname $groupcode
```

![Task 02](./task02.png)

Task 03
---

```ps1
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
```

![Task 03](./task03.png)

Task 04
---
![Task 04](./task04.png)

Task 05
---
![Task 05](./task05.png)