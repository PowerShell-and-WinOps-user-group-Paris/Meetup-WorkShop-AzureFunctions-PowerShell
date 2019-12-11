# Requirements 

To follow the instructions you will need 

* An Azure Subscription. You can have a trial [Here](https://azure.microsoft.com/en-us/free/search/?&ef_id=CjwKCAiAqqTuBRBAEiwA7B66hSFm2RLrRBlqzgfg3ova-T3tjy3N1JiGOxLqVZCyFRTFc4gLmFRVshoCzlgQAvD_BwE:G:s&OCID=AID2000074_SEM_PIytiGb1&MarinID=PIytiGb1_367959202779_azure%20free%20subscription_e_c__79324260874_kwd-334332457116&lnkd=Google_Azure_Brand&dclid=CjkKEQiAqqTuBRCn7eaB4qqywb0BEiQAH2sZi0hUwBPkvbB0kLL6Sfnth3LpJKqZ8GHjKQqKylTiRH3w_wcB)

* PowerShell Core 
To install it you can use Chocolatey 

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

```
`choco install powershell-core
``

* install Azure PowerShell Module 

```
instal-module -name AZ -scope CurrentUser
```