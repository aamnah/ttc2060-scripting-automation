#!/bin/bash 
<<task_33_brief
Modify Task 2.

[x] Create a script that prints a number of objects in a **given directory** to the user. 
[x] The path is asked from the user.
task_33_brief

read -p 'Please provide a directory path: ' DIR

count_objects() {
  COUNT=$(ls $1 | wc -l)
  
  echo "There are $COUNT objects in the provided directory"
}

count_objects $DIR