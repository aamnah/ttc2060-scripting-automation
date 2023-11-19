#!/bin/bash 
<<task_34_brief
Modify Task 3.

[x] User can give unlimited number of paths and given paths are saved in the **array**.

[x] Function takes an array as an argument.

Hints: **read** commands options might be useful or some kind of loop.
task_34_brief

read -p 'Please provide a directory paths: ' -a DIR_PATHS

CYAN="\e[36m"
ENDCOLOR="\e[0m"

count_objects() {
  # use arr=("$@") to get the array parameter instead of arr="$1"
  # https://askubuntu.com/a/674347
  PATHS_ARRAY=("$@")

  for x in "${PATHS_ARRAY[@]}"
  do 
    COUNT=$(ls $x | wc -l)
    echo -e "${CYAN} $x ${ENDCOLOR}directory has ${CYAN}$COUNT${ENDCOLOR} objects"
  done
}

# Expanding an array without an index only gives the first element, 
# use count_objects "${array[@]}" instead of count_objects $array
count_objects "${DIR_PATHS[@]}"

