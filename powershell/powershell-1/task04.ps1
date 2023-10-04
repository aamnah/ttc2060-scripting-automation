# Task 04
# Create an array named $names, that includes seven (7) names. You can select the names, they can be your friends or comic characters. 
# Create a script that show how many items is in the array, show the items and also the first and last name of the array.
$names = @('Adeel', 'Raheel', 'Waqas', 'Soban', 'Safwan', 'Umar', 'Sannan')

Write-Host "There are $($names.Count) friends:"
Write-Host $names.ForEach({Write-Host $_})
Write-Host "The oldest is $($names[0]) and the youngest is $($names[6])"