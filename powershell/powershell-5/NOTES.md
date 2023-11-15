# PS: User Management, Events, Exceptions

- [User Management](https://ttc2060.pages.labranet.jamk.fi/Powershell/15-UserManagement/)
- [Events](https://ttc2060.pages.labranet.jamk.fi/Powershell/16-Events/)
- [Exceptions](https://ttc2060.pages.labranet.jamk.fi/Powershell/17-Exceptions/)

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

```ps1
# Remove a user
Remove-LocalUser -Name nackni

# Remove multiple local users
# Name expects String[]
Remove-LocalUser -Name nackni, russja, bellan
```

## Events


```ps1
# Register a new source
New-EventLog -LogName $LogName -Source $Source

# Sample EventLog entry
Write-EventLog -LogName Application -Source 'MyPowerShell' -EntryType Information -Message 'Hello from the other side' -EventId 1

```

```ps1
# Check what commands are available related to events and eventlogs
Get-Command -Name *event
Get-Command -Name *eventlog
```

```ps1
Get-Command -Name *event
```

```
CommandType     Name                                     Version    Source
-----------     ----                                     -------    ------
Cmdlet          Get-Event                                3.1.0.0    Microsoft.PowerShell.U...
Cmdlet          Get-WinEvent                             3.0.0.0    Microsoft.PowerShell.D...
Cmdlet          New-Event                                3.1.0.0    Microsoft.PowerShell.U...
Cmdlet          New-WinEvent                             3.0.0.0    Microsoft.PowerShell.D...
Cmdlet          Register-CimIndicationEvent              1.0.0.0    CimCmdlets
Cmdlet          Register-EngineEvent                     3.1.0.0    Microsoft.PowerShell.U...
Cmdlet          Register-ObjectEvent                     3.1.0.0    Microsoft.PowerShell.U...
Cmdlet          Register-WmiEvent                        3.1.0.0    Microsoft.PowerShell.M...
Cmdlet          Remove-Event                             3.1.0.0    Microsoft.PowerShell.U...
Cmdlet          Unregister-Event                         3.1.0.0    Microsoft.PowerShell.U...
Cmdlet          Wait-Event                               3.1.0.0    Microsoft.PowerShell.U...
```


```ps1
Get-Command -Name *eventlog
```

```
CommandType   Name                    Version    Source
-----------   ----                    -------    ------
Cmdlet        Clear-EventLog          3.1.0.0    Microsoft.PowerShell.Management
Cmdlet        Get-EventLog            3.1.0.0    Microsoft.PowerShell.Management
Cmdlet        Limit-EventLog          3.1.0.0    Microsoft.PowerShell.Management
Cmdlet        New-EventLog            3.1.0.0    Microsoft.PowerShell.Management
Cmdlet        Remove-EventLog         3.1.0.0    Microsoft.PowerShell.Management
Cmdlet        Show-EventLog           3.1.0.0    Microsoft.PowerShell.Management
Cmdlet        Write-EventLog          3.1.0.0    Microsoft.PowerShell.Management
```

- `Show-EventLog` opens the Event Viewer GUI
- Creating new logs requires administrator privileges
- `Get-EventLog` is deprecated. Use the newer `Get-WinEvent`

```ps1
Get-EventLog -LogName System -Newest 10 -EntryType Error

Get-WinEvent -LogName System -MaxEvents 10
```

In order to add logs, you need to register a new source. Needs admin privileges.

```ps1
Write-EventLog -LogName 'Windows PowerShell' -Source Powershell -EntryType Information -EventId 1 -Message 'all good'
# will ask for source interactively

Write-EventLog -LogName 'Windows PowerShell' -Source Powershell -EntryType Information -EventId 1 -Message 'all good'

# see the logs for PowerShell
Get-EventLog -LogName 'Windows PowerShell' -Newest 10
```