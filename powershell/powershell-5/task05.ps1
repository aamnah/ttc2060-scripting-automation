<# 5.5
In this task you have to create a new function called Add-MyEvent. The function takes two parameter: Type and Message. The type can be: Error, Warning, or Information. Message is a clear message. Add the following functionality to the task 04 using your new function.
- if the script can create a new CSV-file succesfully, then it will add a Information message to the eventlog. - if the script cannot create a file succesfully, then it adds a Error message to the eventlog.
Before using your new function create a new source named "MyPowerShell" to the Evenlog for writing your events. #>