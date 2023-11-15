#!/bin/bash 
<<task_15_brief

[x] Create a script that deletes the given files from the users home directory. 
[x] Files are passed to the script using a command line arguments (3 values).
[x] (Create a empty files in users home folder to test the functionality). 
[x] Finally script prints: i deleted the following files: x,y,z

task_15_brief

declare -a FILES_TO_DELETE
declare -a FILES_SUCCESSFULLY_DELETED

DIRECTORY=$HOME

# Default values based on arguments provided
FILES_TO_DELETE[0]=$1
FILES_TO_DELETE[1]=$2
FILES_TO_DELETE[2]=$3

prompt_for_filenames() {
  read -p "Provide the first file to delete (1/3) : " FILES_TO_DELETE[0]
  read -p "Provide the second file to delete (2/3) : " FILES_TO_DELETE[1]
  read -p "Provide the third file to delete (3/3) : " FILES_TO_DELETE[2]
  echo "" # empty line for visual aid
}

show_404_error() {
  echo -e "$1 not found."
}

delete_file() {
  # the script requires deleting from a certain directory (in this case $HOME)
  FILE="${DIRECTORY}/$1"

  if [ -e "$FILE" ]; then
    rm $FILE
    FILES_SUCCESSFULLY_DELETED+=("$FILE")
  else
    show_404_error $FILE
  fi
}

delete_all_files() {
  delete_file ${FILES_TO_DELETE[0]}
  delete_file ${FILES_TO_DELETE[1]}
  delete_file ${FILES_TO_DELETE[2]}

  echo -e "\nI deleted the following files:" 
  echo ${FILES_SUCCESSFULLY_DELETED[@]} | tr ' ' '\n' # show every item in array on a new line
}

# RUN
if [ "$#" -eq 0 ]
then
  prompt_for_filenames
  delete_all_files

elif [ "$#" -eq 3 ]
then
  delete_all_files

else
  echo "You provided an invalid number of arguments. Exiting"
fi