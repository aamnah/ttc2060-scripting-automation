#!/bin/bash 
<<task_25_brief
Create a script that mimics a simple calculator.
At first, script asks the operation from the user (-, +, *, / ). After the user selects operation, two values are asked and the outcome is printed to the user.
Script execution stops when the user selects "exit" operation.
task_25_brief

# Space separated list of options
CALCULATION_OPTIONS="- + \* / Exit"
RESULT=''

#(optional) PS3 system variable is used to print out the wanted string when asking the number from the user, the default value is #?
PS3="Select: "

select OPERATION in ${CALCULATION_OPTIONS}
do
  if [ "${OPERATION}" = "Exit" ]
  then
    break
  fi

  read -p "Please enter a value: " VALUE_1
  read -p "Please enter another value: " VALUE_2

  if [ "${OPERATION}" = "\*" ]; then
    RESULT=$(($VALUE_1 * $VALUE_2))
  elif [ "${OPERATION}" = "/" ]; then
    RESULT=$(($VALUE_1 / $VALUE_2))
  else 
    RESULT=$(($VALUE_1 $OPERATION $VALUE_2))
  fi
 
  echo "${VALUE_1} ${OPERATION} ${VALUE_2} equals: ${RESULT}"

done
echo "Exiting calculator..."