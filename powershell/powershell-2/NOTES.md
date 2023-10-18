# Objects, pipelines, scripts

- [Objects](https://ttc2060.pages.labranet.jamk.fi/Powershell/09-Objects/)
- [Pipelines](https://ttc2060.pages.labranet.jamk.fi/Powershell/11-Pipeline/)
- [Scripts](https://ttc2060.pages.labranet.jamk.fi/Powershell/10-Scripts/)

## Objects

- Type `FileInfo`
- Method `CopyTo`
- Property `LastWriteTime`


Check if something is an object with `-is [object]`

```ps1
#first set AppInfo to a variable
$a = Get-Service -Name Appinfo

#check is it an object
$a -is [object]
```