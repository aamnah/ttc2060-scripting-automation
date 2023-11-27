#!/bin/bash 
<<task_54_brief
[ ] Create a script that have a function that 
  [ ] changes services listening ports (80 x2) and 
  [ ] default page (index.html) defined in [example.conf](./example.conf).
[ ] New values are given as command line arguments during the script startup. 
  [x] Only one port is given and it's used for both fields.

NOTE: Script should overwrite the default values, not every possible value in that spot (think that those are values after the apt install command)

Hints:
- 'sed' command needs some option to write the changes.
task_54_brief

FILE="example.conf"
PORT=""
PAGE=""

function get_values {
  read -p "What should i set as new PORT? " PORT
  read -p "What should i set as new INDEX page? " PAGE
}

function set_values {
  sed --in-place --regexp-extended "s/80/${PORT}/ig" $FILE
  sed --in-place --regexp-extended "s/index.html/${PAGE}/i" $FILE
}

get_values
set_values $PORT $PAGE