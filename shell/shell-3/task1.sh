#!/bin/bash 
<<task_31_brief
[x] Create a script that asks values from the user until user types exit. 
[x] All the values are saved in array. 
[x] Finally script prints out the whole array (line by line) using the following syntax: "index: value".
task_31_brief

#new indexed array defination with a declare builtin command and manual value assignment
# () can be used for compound assignments
# -a is or indexed arrays
# -A is for associative arrays (dictionaries)
declare -a DATARAY

INPUT=''

ask_for_value() {
  read -p "Please enter a value: " INPUT
  DATARAY+=(${INPUT})
}

ask_for_value

# Check uf user typed exit
if [ $(echo "${INPUT}" | tr "[:upper:]" "[:lower:]") == "exit" ]
# $(echo "${INPUT}" | tr "[:upper:]" "[:lower:]")
# is to check for the word in a case-insensitive way
# will check for Exit, exit or eXiT
then
  exit
else
  # Keep asking for input until the user enters exit
  until [ $(echo "${INPUT}" | tr "[:upper:]" "[:lower:]") == "exit" ]
  do
    ask_for_value
  done
fi

# Output
for x in "${!DATARAY[@]}"
do
  # inedx: value
  echo "${x}: ${DATARAY[$x]}"
done