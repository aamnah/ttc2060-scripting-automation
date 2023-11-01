TIPS:

- Piping some text to `xargs` trims the whitespace around the text [ref](https://stackoverflow.com/questions/369758/how-to-trim-whitespace-from-a-bash-variable)


Arrays in Bash

```bash
declare -a SAMPLE_ARRAY_1

SAMPLE_ARRAY_1+="sample.csv"
SAMPLE_ARRAY_1+="foo.txt"
SAMPLE_ARRAY_1+="bar.txt"
echo ${SAMPLE_ARRAY_1[@]} # sample.csvfoo.txtbar.txt

declare -a SAMPLE_ARRAY_2

SAMPLE_ARRAY_2+=("sample.csv")
SAMPLE_ARRAY_2+=("foo.txt")
SAMPLE_ARRAY_2+=("bar.txt")
echo ${SAMPLE_ARRAY_2[@]} # sample.csv foo.txt bar.txt
```

`+=""` without the parantheses outputs the array as a single string
`+=("")` with the paranthese outputs a space separated array

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