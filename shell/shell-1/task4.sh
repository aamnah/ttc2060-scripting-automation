#!/bin/bash 
<<task_14_brief

[x] Create a script that copies the given file to a path provided by the user. 
[x] So both paths should be asked from the user.
[x] Finally script prints: "copied the "original file" to "given path"!".

task_14_brief

FILE_PATH=$($1 | xargs) # initialize with default value if provided to script
COPY_LOCATION=$($2 | xargs) # initialize with default value if provided to script

prompt_for_values() {
  read -p 'What file do you want to copy [absolute path]: ' FILE_PATH
  read -p 'Where should i copy that file [absolute path]: ' COPY_LOCATION
}

copy_files() {
  if ! [[ -e $FILE_PATH ]]
  then
    # if provided file does not exist, we can not copy it
    echo -e "\nFile $FILE_PATH does not exist. Exiting"
    # Only absolute paths would work
    # Relative paths are resolved from the working directory of the process that calls your script.

  elif ! [[ -d "$COPY_LOCATION" ]]
  then
    # if provided copy location does not exist, we can not copy to it
    # If a relative link is provided, it will also fail
    echo -e "\n$COPY_LOCATION is an invalid path. Exiting"

  else
    cp $FILE_PATH $COPY_LOCATION
    echo -e "\nCopied ${FILE_PATH} to ${COPY_LOCATION}!"
  fi
}

# RUN
prompt_for_values
copy_files