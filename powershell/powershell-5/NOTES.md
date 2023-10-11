# PS: User Management, Events, Exceptions

- [User Management](https://ttc2060.pages.labranet.jamk.fi/Powershell/15-UserManagement/)
- [Events](https://ttc2060.pages.labranet.jamk.fi/Powershell/16-Events/)
- [Exceptions](https://ttc2060.pages.labranet.jamk.fi/Powershell/17-Exceptions/)

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