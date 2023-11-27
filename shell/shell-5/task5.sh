#!/bin/bash 
<<task_55_brief
[x] Create a script that reads [superhero.json] file.
[x] Script prints hero names to the user who selects which heroes powers or secret identity he/she wants to see.
[x] Script prints the desired values to the user.
[x] Script will continue asking what to do till user gives some string to exit to script (exit perhaps?).

Hints:
- any iterations structure
- 'jq' command
task_55_brief


FILE="superhero.json"
HEROES_LENGTH=$(( $(jq ".members | length" $FILE) + 0 ))

HEROES=()

# Populate the Heroes array
###############################
COUNT=0
while [ $COUNT -lt $HEROES_LENGTH ]
do
  NAME=$(cat $FILE | jq ".members[$COUNT].name")
  # echo $NAME
  HEROES+=("$NAME")

  ((COUNT++))
done

# Show a select menu for Heroes
##################################
PS3="Which hero do you want to know? "
select option in "${HEROES[@]}" Exit
do
  if [ "$option" == "Exit" ]
  then
    break
  fi

  # The read line is saved in the REPLY variable.
  INDEX=$(($REPLY - 1)) # index is 0-based while select menu starts at 1
  MEMBER=$(jq ".members[$INDEX]" $FILE)
  SECRET_IDENTITY=$(jq ".members[$INDEX].secretIdentity" $FILE)
  POWERS=$(jq ".members[$INDEX].powers[]" $FILE)

  echo -e "\nThe secret identity of ${option} is ${SECRET_IDENTITY}. Powers are:"
  echo -e "\n$POWERS\n"
done
echo 'Exiting.. '


# this block does NOT work because of {0..$VAR}
# for x in {0.."$HEROES_LENGTH"}
# do
#   NAME=$(cat $FILE | jq ".members[$x].name")
#   echo $NAME
#   HEROES+=("$NAME")
# done

# echo "Which hero do you want to know? "
# for KEY in "${!HEROES[@]}"
# do
#   echo "${KEY}: ${HEROES[$KEY]}"
# done