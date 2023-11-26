#!/bin/bash 
<<task_52_brief
[ ] Create a script that reads [cars.csv](./cars.csv) file.
[ ] File that is read must be given at the script startup as a command line argument.
[ ] Script reads information from the file and prints the values to the user.

Output format:
--- Line 1 ---
Manufacturer: X
Model: X
Color: X
Year: X
--- Line 2 ---
Manufacturer: Y
Model: Y
Color: Y
Year: Y
task_52_brief

FILE=''
VALUES=()

read -p "Give me a file to read: " FILE

# Read the file and save the lines to an array
while IFS=',' read -r LINE
do
  VALUES+=(${LINE})
done < $FILE

function output_values {
  # Takes an array built from a csv file and loops over it
  # Evrey item in an array is a comma separated line from a CSV
  
  # use arr=("$@") to get the array parameter instead of arr="$1"
  # https://askubuntu.com/a/674347
  DATA=("$@")

  for KEY in "${!DATA[@]}" # get key/value pairs
  do
    if [ "$KEY" -ne 0 ] # skip outputting the header row
    then
      manufacturer=$(echo ${VALUES[$KEY]} | cut -d ',' -f 1) 
      model=$(echo ${VALUES[$KEY]} | cut -d ',' -f 2) 
      color=$(echo ${VALUES[$KEY]} | cut -d ',' -f 3) 
      year=$(echo ${VALUES[$KEY]} | cut -d ',' -f 4) 

      echo "--- Line $KEY ---"
      echo "Manufacturer: ${manufacturer}"
      echo "Model: ${model}"
      echo "Color: ${color}"
      echo "Year: ${year}"
      echo ""
    fi
  done
}

# Expanding an array without an index only gives the first element, 
# pass: "${array[@]}" 
# instead of: $array
output_values "${VALUES[@]}"