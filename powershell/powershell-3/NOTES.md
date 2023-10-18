# File System

## TIPS
- Pressing `command/ctrl` + `space` while specifying flag values will give you available options that you can then select

```ps1
New-Item 'test' -ItemType ctrl+space

Copy-Item -ctrl+space
```

`$_` is a built-in variable. Inside a loop, the current item being iterated over is copied to `$_`

Prefer using the Windows version of commands and not aliases. For exmaple, `Get-ChildItem` instead of `pwd`

- `Get-Location` or `pwd` get current directory


### Join Paths
Join path is handy when you want multi-OS compatability. For example, it will automatically determine whether to use `/` or `\` based on whether the script is running on Linux or Windows

```ps1
$a = Join-Path $HOME 'test'

$a #C:\Users\ad9795\test
```


```ps1
# Get all items that are not a folder
Get-ChildItem | Where-Object { $_.PsIsContainer -eq $TRUE }

# Get only get file names for items that are not a folder
Get-ChildItem | Where-Object { $_.PsIsContainer -eq $TRUE } | Format-Table Name
```

Create a directory


# Read & Write Files

`Get-Content` - read file
`Add-Content` - write file

```ps1
$friends = Get-Content .\Names.txt

$friends.GetType() # array
$friends[0].GetType() # string

$moreFriends = 'Irshad', 'Jane', 'Kashif'
Add-Content Names.txt -Value $moreFriends
```

```ps1
# Add the listing of current directory to the Foo.txt file
Get-ChildItem | Add-Content Foo.txt
```


## Reading CSV Files

Names.csv

```
Firstname,Lastname,Age
Anna,Harris,21
Bella,Davis,33
Charlie,Kingsley,28
Dave,Rupert,43
```

```ps1
$names = Import-Csv .\Names.csv

$names
```

```
Firstname Lastname Age
--------- -------- ---
Anna      Harris   21
Bella     Davis    33
Charlie   Kingsley 28
Dave      Rupert   43
```


```ps1
$names.GetType() # Array
$names[0].GetType() # System.Object

$names | ForEach-Object {Write-Host 'Hello' $_.Firstname $_.Lastname}
```

```
Hello Anna Harris
Hello Bella Davis
Hello Charlie Kingsley
Hello Dave Rupert
```
