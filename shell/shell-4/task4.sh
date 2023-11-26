#!/bin/bash 
<<task_44_brief
[ ] Create a script that has a function called network_information that shows the following information:
  [ ] ip address: 
  [ ] hostname: 
[ ] Log the messages in the syslog with a custom tag "network-information".

Hints: Utilize arrays and ip or hostname commands with options
task_44_brief

IP_ADDRESS="$(hostname -i)"
HOSTNAME=$(hostname)
TAG="network-information"

function network_information {
  echo -e "ip address: $IP_ADDRESS"
  echo -e "hostname: $HOSTNAME"
  
  logger -i -t $TAG "IP Address is: $IP_ADDRESS, and Hostname is: $HOSTNAME"
}

network_information