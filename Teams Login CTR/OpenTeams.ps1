#Open Teams Script
clear


#Get Username from Text File
$userName = Get-Content -Path "C:\Users\Rich\Documents\Rich\PowerShell\Teams Login (CTR)\Username.txt"

#Establish Typing Object
$typer = New-Object -ComObject wscript.shell

#Open Incognito Tab in Chrome
[System.Diagnostics.Process]::Start("chrome", "--incognito https://dod.teams.microsoft.us/")

#Enter Username
Sleep 5
$typer.SendKeys($userName)
$typer.SendKeys('{ENTER}')
Sleep 8
$typer.SendKeys('{TAB}')
$typer.SendKeys('{TAB}')
$typer.SendKeys('{ENTER}')
Sleep 5
$typer.SendKeys('{DOWN}')
$typer.SendKeys('{ENTER}')