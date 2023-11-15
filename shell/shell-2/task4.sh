#!/bin/bash 
<<task_24_brief
Create a script to automate user creation. NOTE: no password setup!
Script asks username from the user and before the user is created, script must check if the user with that name exists.
Use the following syntax in you conditional statement: if id -u USERNAME. If the user doesn't exist, conditional statement returns false (actual id command returns "no such user" / error code 1).
New user must have home directory under the /home/ directory and default shell as bash.
Hint: User creation needs sudo permissions, how to execute script with it?
task_24_brief

# need to run script with SUDO, otherwise user creation will not work

USERNAME=''

create_user() {
  read -p "Please provide a username: " USERNAME

  # by default user ID will be returned to the console. e.g. 1000
  # redirect to /dev/null to get rid of that, so that only the output we want is shown
  if id -u "$USERNAME" >/dev/null 2>&1
  then
    echo "${USERNAME} already exists. Exiting."
  else 
    useradd ${USERNAME} --create-home --shell=/bin/bash
    echo -e "User ${USERNAME} successfully created. Listing /home/.. \n"
    ls -HF /home/
  fi
}

delete_user() {
  sudo userdel $1
  sudo rm -r /home/$1
}

create_user

#delete_user $USERNAME