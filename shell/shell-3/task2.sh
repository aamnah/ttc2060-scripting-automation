#!/bin/bash 
<<task_32_brief
[x] Create a script that prints the number of objects in the directory where you executed the script from.

[x] Script must consist a function called "count_objects". Function must have one local variable, that will hold the actual value, before it's printed to the user.

Hints: Function has a print functionality. "wc" command might be useful.
task_32_brief

count_objects() {
  COUNT=$(ls | wc -l)
  echo $COUNT
}

count_objects