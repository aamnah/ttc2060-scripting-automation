Related topics: 

- [Exit codes and statuses](https://ttc2060.pages.labranet.jamk.fi/Shell/08.-Exit-codes-and-statuses/)
- [Debug and logs](https://ttc2060.pages.labranet.jamk.fi/Shell/09.-Debug-and-log/)


## Task 1
Create a script that asks URL from the user and a function that tries to ping it with a 1 package.

- If ping is successful, return a exit code 0.
- If not, return a exit code 1.

Based on the exit code that the function returned, print outcome to user.


## Task 2
Create a script that prints 3 random numbers on the terminal and also generates a syslog message with a correlating number for each random number.

Log message priority should be `user.info`.

Hints: Special variable `$RANDOM`


## Task 3
Create a script that installs the program using apt, based on the user input. (`cowsay` etc.)

If the installation is successful, tell that to the user and exit normally.

If not, inform user and exit with a code 111.

Hints: sudo permissions and apt options


## Task 4
Create a script that has a function called network_information that shows the following information:

- ip address: 
- hostname: 

Log the messages in the syslog with a custom tag "network-information".

Hints: Utilize arrays and ip or hostname commands with options


## Task 5
Create a script that has 3 functions: `mk_folder`, `download_image` and `change_perm`.

- `mk_folder` function asks a new folder path from the user and creates the folder.
- `download_image` function downloads the following image to the previously created directory and renames it as a linux-tux.png: [image](https://student.labranet.jamk.fi/~pekkju/script/tux.png)
- `change_perm` function sets the folder and image permissions in a way that only owner has rights to them (rwx).

Every possible variable substitution and command execution must be shown in the terminal during the execution.