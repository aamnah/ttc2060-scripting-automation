#!/bin/bash 
<<task_35_brief
[x] Modify **Exercise set 2, Task 5** (Create a script that mimics a simple calculator).

[x] Change the logic that all operations are calculated by using functions.
task_35_brief

# Operations are defined with an array
CALCULATION_OPTIONS=('-' '+' '*' '/')
DECIMAL_POINTS=2
RESULT=''

#(optional) PS3 system variable is used to print out the wanted string when asking the number from the user, the default value is #?
PS3="Select: "

add() {
  ADDITION=$(echo "scale=$DECIMAL_POINTS; $1 + $2" | bc)
  echo $ADDITION
}

subtract() {
  SUBTRACTION=$(echo "scale=$DECIMAL_POINTS; $1 - $2" | bc)
  echo $SUBTRACTION
}

multiply() {
  MULTIPLICATION=$(echo "scale=$DECIMAL_POINTS; $1 * $2" | bc)
  echo $MULTIPLICATION
}

divide() {
  DIVISION=$(echo "scale=$DECIMAL_POINTS; $1 / $2" | bc)
  echo $DIVISION
}

# Select from the values of CALCULATION_OPTIONS array and the value Exit
select OPERATION in "${CALCULATION_OPTIONS[@]}" Exit
do
  if [ "${OPERATION}" = "Exit" ]
  then
    break
  fi

  read -p "Please enter a value: " VALUE_1
  read -p "Please enter another value: " VALUE_2

  case ${OPERATION} in
    "*")
      RESULT=$(multiply $VALUE_1 $VALUE_2)
      ;;
    "/")
      RESULT=$(divide $VALUE_1 $VALUE_2)
      ;;
    "+")
      RESULT=$(add $VALUE_1 $VALUE_2)
      ;;
    "-")
      RESULT=$(subtract $VALUE_1 $VALUE_2)
      ;;
    "*")
      RESULT=$(($VALUE_1 $OPERATION $VALUE_2))
  esac
  
  echo -e "${VALUE_1} ${OPERATION} ${VALUE_2} equals: ${RESULT}\n"

done
echo "Exiting calculator..."