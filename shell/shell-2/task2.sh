#!/bin/bash 
<<task_22_brief
Write a shell script that checks if the file /etc/hosts exists.
If the file exists, script prints the outcome: /etc/hosts available.
Also check can you write in the file.
Script prints the outcome: You have permission to edit the file OR you dont have permission to edit the file
task_22_brief

FILE='/etc/hosts'

check_etc_perms() {
  if [ -e "${FILE}" ], then
    # check if ${FILE} exists
    echo "${FILE} available"

    # check if you can write in ${FILE}
    if [ -w "${FILE}" ], then
      echo "You have permission to edit the file"
    elif ![ -w "${FILE}" ], then
      echo echo "You do not have permission to edit the file"
    fi
  fi
}

check_etc_perms
