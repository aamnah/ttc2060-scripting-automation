#!/bin/bash 
<<task_11_brief
[x] Create a script that takes two command line arguments.
[x] Script returns the following arithmetic solutions: 
  [x] addition
  [x] subtraction
  [x] multiplication
task_11_brief

VALUE_1=$1 # initialize with default value if provided to script
VALUE_2=$2 # initialize with default value if provided to script
DECIMAL_POINTS=2

# if no arguments were passed, ask the user for the two values
if [ "$#" -lt 2 ]
then
  read -p 'Provide Value 1: ' VALUE_1 
  read -p 'Provide Value 2: ' VALUE_2
elif [ "$#" -gt 2 ]
then
  echo "You provided more than two values. My script is not advanced enough to handle that. Exiting"
  exit 1 # non-zero exit code means script failed
fi

ADDITION=$(echo "scale=$DECIMAL_POINTS; $VALUE_1 + $VALUE_2" | bc)
SUBTRACTION=$(echo "scale=$DECIMAL_POINTS; $VALUE_1 - $VALUE_2" | bc)
MULTIPLICATION=$(echo "scale=$DECIMAL_POINTS; $VALUE_1 * $VALUE_2" | bc)

echo -e "" # empty line for line break
echo -e "Addition ($VALUE_1 + $VALUE_2): $ADDITION"
echo -e "Subtraction ($VALUE_1 - $VALUE_2): $SUBTRACTION"
echo -e "Multiplication ($VALUE_1 * $VALUE_2): $MULTIPLICATION"