#!/bin/bash 
<<task_42_brief
[x] Create a script that prints 3 random numbers on the terminal and 
[x] also generates a syslog message with a correlating number for each random number.
[x] Log message priority should be user.info.
Hints: Special variable $ RANDOM
task_42_brief

# https://tldp.org/LDP/abs/html/randomvar.html

# $RANDOM returns a different random integer at each invocation.
# Nominal range: 0 - 32767 (signed 16-bit integer).

PRIORITY="user.info"
MAXCOUNT=3
COUNT=1

# NUM_1="$RANDOM"
# NUM_2="$RANDOM"
# NUM_3="$RANDOM"
# echo -e "$NUM_1 $NUM_2 $NUM_3" # 11179 12934 22395

while [ $COUNT -le $MAXCOUNT ]
do
  NUMBER=$RANDOM
  echo -e "$NUMBER"
  logger -i -t $NUMBER -p $PRIORITY "This is correlating message for $NUMBER"

  let "COUNT += 1" 
done