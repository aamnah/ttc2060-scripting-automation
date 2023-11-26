#!/bin/bash 
<<task_43_brief
[x] Create a script that installs the program using apt, based on the user input. (cowsay etc.)
[x] If the installation is successfull, tell that to the user and exit normally.
[x] If not, inform user and exit with a code 111.
Hints: sudo permissions and apt options
task_43_brief


function install_package {
  read -p "What program would you like to install? " PACKAGE

  sudo apt install -qq $PACKAGE

  if [ ${?} -ne 0 ]
  then
    echo -e "\nFailed to install $PACKAGE\n"
    exit 111
  else
    echo -e "\nSuccessfully installed $PACKAGE\n"
    exit
  fi
}

install_package