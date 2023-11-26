#!/bin/bash 
<<task_51_brief
[x] Create a script that asks values from the user until user decides to end the script.  
[x] Given values are added to the end of file called 'animal.txt'
[x] Finally script prints every value from the file.  
task_51_brief

FILE="animal.txt"
INPUT=""

function aks_for_value {
  read -p "Give me an animal name, or enter 'q' to end the script: " INPUT
}


to_lower() {
  # $(echo "${INPUT}" | tr "[:upper:]" "[:lower:]")
  # is to check for the word in a case-insensitive way
  # will check for Exit, exit or eXiT
  echo "${1}" | tr "[:upper:]" "[:lower:]"
}


while true
do
  aks_for_value
  if [ $(to_lower "$INPUT") ==  "q" ]
  then
    break
  else
    echo -e "$INPUT" >> $FILE
  fi
done

echo -e "\nThe values in $FILE are: \n"
cat $FILE
