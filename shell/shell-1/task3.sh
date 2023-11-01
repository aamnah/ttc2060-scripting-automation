#!/bin/bash 
<<task_13_brief

[x] Create a script that returns how many objects are in the given directory (do not include hidden files). 
[x] Directory path is asked from the user.

Hints: 'wc' command might be useful.

task_13_brief

DIRECTORY=$1 # variables like ~ and $HOME also work

prompt_for_directory_path() {
  read -p 'Please provide a directory path: ' DIRECTORY
}

count_files() {  
  if [ -d $DIRECTORY ]
  then
    COUNT=$(ls $DIRECTORY | wc -l | xargs)
    echo -e "\nThere are $COUNT objects in the $DIRECTORY"
  else 
    echo -e "$DIRECTORY is not a valid path, it does not exist. Exiting"
    exit 1
  fi
}

# RUN
if [ "$#" -eq 0 ]
then
  # if no arguments were passed, ask the user for the directory path
  prompt_for_directory_path
  count_files

elif [ "$#" -eq 1 ]
then
  count_files

else
  # if too many args were passed, ask the user for the directory path
  echo 'Invalid number of arguments provided. I need a directory path.'
  prompt_for_directory_path
  count_files
fi

