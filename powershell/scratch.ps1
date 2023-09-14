# Get system information
# Get-ComputerInfo

# Get a particular property from system information
# Get-ComputerInfo -Property 'OsName'

# Get PowerShell version
# $Host.version

# Get PowerShell version in extended details
# $PSVersionTable

<# # Variables
$name1 = 'Amna'
$name2 = 'Fazal'
 #>

<# 
# Output
# 1. no need to add spaces when directly writing with Write-Host
# spaces are auto-inserted
Write-Host $name1 'and' $name2 'are awesome!'
# Amna and Fazal are awesome!

# 2. Variable Substitution
# Requires double-quotes in order to evaluate variables
Write-Host "$name1 and $name2 are awesome!"
# Amna and Fazal are awesome!

$message = "$name1 and $name2 are awesome!"
Write-Host $message
# Amna and Fazal are awesome!

# 3. String Concatenation with +
$message = $name1 + ' and ' + $name2 + ' are awesome!'
Write-Host $message
# Amna and Fazal are awesome!

# 4. Format String
$message = '{0} and {1} are awesome!' -f $name1, $name2
Write-Host $message
# Amna and Fazal are awesome!

# Format Strings and String Concatenation can not be done
# diectly in Write-Host
Write-Host $name1 + ' and ' + $name2 + ' are awesome!'
# Amna +  and  + Fazal +  are awesome!

Write-Host'{0} and {1} are awesome!' -f $name1, $name2
# ERROR: Write-Host : Cannot bind parameter 'ForegroundColor'.  
#>

# $firstname, $lastname, $age = 'James', 'Bond', 42


# $secret = Read-Host "Tell me a secret" -asSecureString

# Write-Host $secret
# # System.Security.SecureString