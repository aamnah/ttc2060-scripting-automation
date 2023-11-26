#!/bin/bash 

# Enable tracing or print debugging
# x = print commands and their arguments as they are executed
set -xe

<<task_45_brief
[x] Create a script that has 3 functions: mk_folder, download_image and change_perm.

[x] mk_folder function asks 
  [x] a new folder path from the user and 
  [x] creates the folder.

[x] download_image function 
  [x] downloads the following image (https://student.labranet.jamk.fi/~pekkju/script/tux.png) to the previously created directory and 
  [x] renames it as linux-tux.png

[x] change_perm function sets the folder and image permissions 
  [x] in a way that only owner has rights to them (rwx).

[x] Every possible variable substitution and command execution must be shown in the terminal during the execution.
task_45_brief

FOLDER_PATH=''

mk_folder() {
  read -p 'Where should i create the folder? ' FOLDER_PATH
  mkdir $FOLDER_PATH
}

download_image() {
 IMAGE_URL='https://student.labranet.jamk.fi/~pekkju/script/tux.png'
 IMAGE_NAME='linux-tux.png'

 wget $IMAGE_URL --output-document="${FOLDER_PATH}/${IMAGE_NAME}"
}

change_perm() {
  # https://linuxcommand.org/lc3_man_pages/chmod1.html
  # <user><group><other> = 700
  chmod -R 700 ${FOLDER_PATH}
}


mk_folder
download_image
change_perm