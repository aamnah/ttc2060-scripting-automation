#!/bin/bash 
<<task_21_brief
Create a script that asks a file to remove from the user.
File is removed if it's a regular file and it's empty, otherwise some kind of error message is printed.
task_21_brief

FILE_TO_REMOVE=$1

remove_file() {
  read -p "Please provide a file to remove (absolute path): " FILE_TO_REMOVE

  if [ -e "${FILE_TO_REMOVE}" ]
  then
    if [ -f "${FILE_TO_REMOVE}" ] # file exists and is a regular file (not a directory or device)
    then
      if [ ! -s "${FILE_TO_REMOVE}" ] # file is empty
      then
        # remove the file and print a success message
        rm ${FILE_TO_REMOVE}
        echo -e "${FILE_TO_REMOVE} has been removed."
      else  # file is not empty
        echo -e "${FILE_TO_REMOVE} is not empty, can not remove."
      fi
    else # file is not a regular file
      echo -e "${FILE_TO_REMOVE} is not a regular file. Could not remove."
    fi
  else
    echo -e "${FILE_TO_REMOVE} does not exist. Could not remove."
  fi
}

remove_file
