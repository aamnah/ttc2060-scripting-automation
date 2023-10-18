---
title: PowerShell Notes
date: 2023-09-14
---

## Comments

```ps1
# This is a line comment

Write-Host 'Hello' # this is an inline comment

<# 
This is a block comment
There are multiple lines
#>
```

## Variables 

```ps1
# Variables
$name1 = 'Amna'
$name2 = 'Fazal'

# You can also define multiple variables in one go
$firstname, $lastname, $age = 'James', 'Bond', 42
```

## Outputting Variables and Strings

```ps1
# Output
# 1. no need to add spaces when directly writing with Write-Host
# spaces are auto-inserted
Write-Host $name1 'and' $name2 'are awesome!'
# Amna and Fazal are awesome!

# 2. Variable Substitution
# Requires double-quotes in order to evaluate variables
Write-Host "$name1 and $name2 are awesome!"
# Amna and Fazal are awesome!

$message = "$name1 and $name2 are awesome!"
Write-Host $message
# Amna and Fazal are awesome!

# 3. String Concatenation with +
$message = $name1 + ' and ' + $name2 + ' are awesome!'
Write-Host $message
# Amna and Fazal are awesome!

# 4. Format String
$message = '{0} and {1} are awesome!' -f $name1, $name2
Write-Host $message
# Amna and Fazal are awesome!

# Format Strings and String Concatenation can not be done
# diectly in Write-Host
Write-Host $name1 + ' and ' + $name2 + ' are awesome!'
# Amna +  and  + Fazal +  are awesome!

Write-Host'{0} and {1} are awesome!' -f $name1, $name2
# ERROR: Write-Host : Cannot bind parameter 'ForegroundColor'. 
```

## Getting user input
You can get user input with `Read-Host`

```ps1
$name = Read-Host "What is your name"

Write-Host "Greetings, $name!"
```

You can also obscure the input by marking it as a _secure string_. For example, passwords.

```ps1
$secret = Read-Host "Tell me a secret" -asSecureString

Write-Host $secret
# System.Security.SecureString
```


Create five files for the tasks

```ps1
1..5 | foreach { New-Item -Path task0$_.ps1 }
```

```
PS /home/user/powershell-4> 1..5 | foreach { New-Item -Path task0$_.ps1 }

    Directory: /home/user/powershell-4

UnixMode   User             Group                 LastWriteTime           Size Name
--------   ----             -----                 -------------           ---- ----
-rw-rw-r-- user             user               10/18/2023 08:41              0 task01.ps1
-rw-rw-r-- user             user               10/18/2023 08:41              0 task02.ps1
-rw-rw-r-- user             user               10/18/2023 08:41              0 task03.ps1
-rw-rw-r-- user             user               10/18/2023 08:41              0 task04.ps1
-rw-rw-r-- user             user               10/18/2023 08:41              0 task05.ps1
```