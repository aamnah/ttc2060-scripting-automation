# TTC2060 - Basics of Scripting and Automatization

- [Moodle](https://moodle.jamk.fi/course/view.php?id=8242)
- [Material - PowerShell](https://ttc2060.pages.labranet.jamk.fi/Powershell/01-introduction/)
- [Material - Shell](https://ttc2060.pages.labranet.jamk.fi/Shell/01.-Introduction/)
- [Linux Basics](https://hantt.pages.labranet.jamk.fi/ttc1040-material/materials/04_basic_cmds/)

VLE is available at: [https://portal.vle.fi/](https://portal.vle.fi/) (use LabraNet credentials)
VM user: `user`
VM password: `root66`

Remember that the [VPN connection](https://student.labranet.jamk.fi/wp-content/uploads/2022/01/LabraNet_Remote_Access_Guide_2022.pdf) to LabraNet is required if you want to access the VLE from home!

You should have the `ExecutionPolicy` set as `Bypass`

```ps1
Get-ExecutionPolicy
# Restricted
```

```ps1
Set-ExecutionPolicy Bypass
```

NOTES
---

2023.09.20

- `Get-Unique` only works when the array is sorted
- `$_` means every item in the array