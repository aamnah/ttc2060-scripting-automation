# PS: User Management, Events, Exceptions

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