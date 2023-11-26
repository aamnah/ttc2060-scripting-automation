#!/bin/bash 
<<task_53_brief
Modify the task 2.

[x] Script should have function that adds a new entry to the [cars.csv](./cars.csv) file based on the user input.
[x] Every value must be asked from the user separately and value/values added should be given to the function as an argument.

Hints:
- Remember delimiters.
- One string might be easier than multiple --> how you can combine multiple strings (concatenate)?
task_53_brief

FILE='cars.csv'

MANUFACTURER=""
MODEL=""
YEAR=""
COLOR=""

function get_details {
  read -p "Manufacturer: " MANUFACTURER
  read -p "Model: " MODEL
  read -p "Year: " YEAR
  read -p "Color: " COLOR
}

function add_csv_line {

  echo -e "\nLet's add a new car to ${FILE}\n"
  get_details

  # Add new entry to file
  #Manufacturer,Model,Year,Color
  echo -e "${MANUFACTURER},${MODEL},${YEAR},${COLOR}" >> $FILE
}

add_csv_line $MANUFACTURER $MODEL $YEAR $COLOR
