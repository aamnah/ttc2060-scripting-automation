#!/bin/bash 
<<task_23_brief
Create a script that returns a type of objects given (file or directory or something else).
User can give unlimited number of paths using the commandline arguments.
Every object type is printed on the own line.
task_23_brief

# loop over all arguments provided by the user
for item in "$@"
do
# Print the file type
  file ${item}
done
