#!/bin/bash 
<<task_41_brief
[x] Create a script that asks URL from the user and a function that tries to ping it with a 1 package.
[x] If ping is successfull, return a exit code 0.
[x] If not, return a exit code 1.
[x] Based on the exit code that the function returned, print outcome to user
task_41_brief

URL="notavailablegoogle.com"

function ping_this {
  read -p "Please provide the URL to ping: " URL
  ping -c 1 -q $URL

  if [ ${?} -ne 0 ]
  then
    echo -e "\nUnable to ping: ${URL}\n"
    exit 1
  else
    echo -e "\nSuccessfully pinged: ${URL}\n"
    exit 0
  fi
}

ping_this