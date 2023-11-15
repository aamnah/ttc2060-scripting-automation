# PS: File System, Importing and Exporting

Creating files
```ps1
# Create a new `File` in a user's home directory `$HOME` called `foo.txt`
New-Item -ItemType File -Path $HOME -Name 'foo.txt'

# Create five numbered files by using a range, `foreach` and pipe
1..5 | foreach { New-Item -Path c:\temp\$_.txt }
## OR
%{1..5} | New-Item c:\temp\$_.txt
```

Add content to a file with `Add-Content`

```ps1

```

Check if a file exists with `Test-Path`