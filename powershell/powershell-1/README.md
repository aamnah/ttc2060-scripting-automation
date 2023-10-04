# PowerShell - Exercise 1

Task 01
---

```ps1
$loggedInUser = whoami
$dateToday = Get-Date -Format d

Write-Host 'Logged username is' $loggedInUser 'and today is' $dateToday
```

![Task 01](./task01.png)

Task 02
---

```ps1
$firstname = Read-Host 'Please, give your firstname'
$lastname = Read-Host 'Please, give your lastname'
$groupcode = Read-Host 'Please, give your groupcode'

Write-Host 'Welcome to course:' $firstname $lastname $groupcode
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

```ps1
$names = @('Adeel', 'Raheel', 'Waqas', 'Soban', 'Safwan', 'Umar', 'Sannan')

Write-Host "There are $($names.Count) friends:"
Write-Host $names.ForEach({Write-Host $_})
Write-Host "The oldest is $($names[0]) and the youngest is $($names[6])"
```

![Task 04](./task04.png)

Task 05
---

```ps1
$numberOfApplications = (Get-Command -CommandType Application | Measure-Object).Count

Write-Host "You got $numberOfApplications applications in Powershell"
```

![Task 05](./task05.png)