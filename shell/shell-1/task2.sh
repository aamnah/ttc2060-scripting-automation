#!/bin/bash 
<<task_12_brief

[x] Create a script that creates a new file in user's home directory.
[x] Script asks a new filename from the user and adds current date as an suffix to a filename (Y-M-D).

task_12_brief

DIRECTORY=$HOME
FILENAME=$1 # default
SUFFIX=$(date +'%Y-%m-%d')
FILE="${DIRECTORY}/${FILENAME}-${SUFFIX}"
MSG_PROMPT="Please provide a file name: "

prompt_for_filename() {
  read -p "${MSG_PROMPT}" FILENAME
  # have to re-assign value for FILE now, 
  # because the one before is created when script is run 
  # and not updated when a new FILENAME is provided
  FILE="${DIRECTORY}/${FILENAME}-${SUFFIX}"
}

create_file() {
  # moved these variables inside here 
  # because when at the top of the file, the values do not update when FILE is updated
  MSG_SUCCESS="\nA new file was created: ${FILE}"
  MSG_OVERWRITE="${FILE} already exists. Do you want to overwrite? [y/N] "

  # If file already exists, ask if we should overwrite
  if [ -e ${FILE} ]
  then
    read -p "${MSG_OVERWRITE}" CONSENT

    # if the user said yes, delete the old file and create a new one
    if [ ${CONSENT} == 'Y' ] || [ ${CONSENT} == 'y' ]
    then
      rm ${FILE}
      touch ${FILE}
      echo -e ${MSG_SUCCESS}
    fi

  # if no existing file, create a new one
  else
    touch ${FILE}
    echo -e ${MSG_SUCCESS}
  fi
}

# RUN
if [ $# -eq 1 ]
then
  create_file

else 
  echo 'Invalid number of arguments provided. I only need a file name'
  prompt_for_filename
  create_file
fi



