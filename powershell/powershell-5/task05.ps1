<# 5.5
[x] In this task you have to create a new function called Add-MyEvent. 
[x] The function takes two parameter: Type and Message. 
[x] The type can be: Error, Warning, or Information. 
[ ] Message is a clear message. 
[ ] Add the following functionality to the task 04 using your new function. 
  [ ] - if the script can create a new CSV-file succesfully, then it will add a Information message to the eventlog. 
  [ ] - if the script cannot create a file succesfully, then it adds a Error message to the eventlog.
[ ] Before using your new function create a new source named "MyPowerShell" to the Evenlog for writing your events. 
#>

# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-7.3#validateset-attribute

function Add-MyEvent() {
  param (
    [ValidateSet("Error", "Warning", "Information")]
    [string]$Type = '',
    [string]$Message = ''
  )

}