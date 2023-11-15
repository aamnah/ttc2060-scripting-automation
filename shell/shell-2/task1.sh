#!/bin/bash 
<<task_21_brief
Create a script that asks a file to remove from the user.
File is removed if it's a regular file and it's empty, otherwise some kind of error message is printed.
task_21_brief

FILE_TO_REMOVE=$1

remove_file() {
  read -p "Please provide a file to remove (absolute path):" FILE_TO_REMOVE

  if [ -e "${FILE_TO_REMOVE}" ]
  then
    if [ -f "${FILE_TO_REMOVE}" ] && ![ -s "${FILE_TO_REMOVE}" ]
    then
      echo -e "${FILE_TO_REMOVE} exists, is a regular file, and is empty"
    fi
  else
    echo -e "${FILE_TO_REMOVE} does not exist"
  fi
}

remove_file
