## Variables

Quoting a variable reference (`"$var"`) prevents word splitting and glob expansion.

```bash
#!/bin/bash
var1="hi all students"

for x in $var1:
do
  echo $x
done
#output:
#hi
#all
#students

#When quoting the variable reference:

for x in "$var1":
do
  echo "$x"
done
#output:
#hi all students
```

## Special variables for arguments

`$0` = The filename of the current script
`$1-9` = The first 9 command line arguments passed to the script
`$#` = How many command line arguments were given
`$@` or `"$@"` = All the command line arguments given (except the script name)
`$$` = The process ID of the script
`$?` = exit status of the last executed command of the script


## Comments

```bash
#!/bin/bash
var1="im a variable"

<<unnecessary
var2="im a variable called 2"
var3="im a variable called 3"
var4="im a variable called 4"
unnecessary

#output:
#im a variable
```

## User Input

```bash
read -p "PROMPT" VARIABLE
```

```bash
#!/bin/bash

echo "Hi! Whats your name?" # print the welcome text

read name # gets the input to a variable called varname

echo "Nice to meet you $name" # print the string + variable value
```

- `-p` = adds prompt message
- `-s` = hides the input from terminal (silent) e.g. when entering passwords


## Variable length

`${#variable}`

```bash
#!/bin/bash

# Get the lenght of the variable value

A="Hi all students!"
echo ${#A} #16

B=30082021
echo ${#B} #8
```