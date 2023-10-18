<# 5.4
[ ] Create a script that writes information of all the local users in a computer to a CSV-file. 
[x] The script has one parameter filename. 
[ ] The information includes local users's 1) name 2) full name 3) SID and 4) lastlogon. 
#>

param(
  [Parameter(Mandatory,
  HelpMessage = "Provide the file to save local user details in.")]
  [string]$Filename = 'localusers.csv'
)

