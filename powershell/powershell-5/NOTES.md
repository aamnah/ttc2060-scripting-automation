# PS: User Management, Events, Exceptions

## Advanced Functions

- Mandatory arguments
- Help messages for arguments
- Validate argument values i.e. enforce a set of possible values (like an _Enum_)

### Mandatory arguments

[Mandatory arguments](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-7.3#mandatory-argument)

```ps1
param(
    [Parameter(Mandatory)]
    [string[]]$ComputerName
)
```

### Help messages for arguments

[HelpMessage argument](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-7.3#helpmessage-argument)

```ps1
param(
    [Parameter(Mandatory,
    HelpMessage="Enter one or more computer names separated by commas.")]
    [string[]]$ComputerName
)
```

```
cmdlet  at command pipeline position 1
Supply values for the following parameters:
(Type !? for Help.)
ComputerName[0]: !?
Enter one or more computer names separated by commas.
ComputerName[0]: localhost
ComputerName[1]:
```

### Enums for argument values with ValidateSet

[ValidateSet attribute](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-7.3#validateset-attribute)

Use `ValidateSet` attribute for a parameter to provide possible values

```ps1
[ValidateSet("Chocolate", "Strawberry", "Vanilla")]
[string]$flavor = "Strawberry"
```

In the above example, the value of the variable `$flavor` must be either Chocolate, Strawberry, or Vanilla.


## Handling Errors

- Terminating errors
- Non-terminating errors (written with `Write-Error`). `Write-Error` does not trigger the `catch`

**Not all errors cause exceptions**.

## User Management

```ps1
Get-LocalUser
New-LocalUser
Remove-LocalUser

Get-LocalGroups
Get-LocalGroupMember -Name Users
```

- You must have at least one user that has administrator rights
- You wouldn't see your Labranet user with `Get-LocalUser`. You are a _domain_ user, not a _local_ one
- You can not add users with domain user admin or local admin rights

```ps1
New-LocalUser -Name 'Test' -NoPassword
```

## Events