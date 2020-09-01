#Create temp folder
New-Item -Path 'C:\temp' -ItemType Directory -Force | Out-Null

Start-Transcript `
-Path 'C:\temp\teams.log' `
-IncludeInvocationHeader

#Install Teams Machine Mode
New-Item -Path 'HKLM:\SOFTWARE\Citrix\PortICA' -Force | Out-Null
write-host "Downloading Teams"(Get-Date)
Invoke-WebRequest -Uri 'https://teams.microsoft.com/downloads/desktopurl?env=production&plat=windows&download=true&managedInstaller=true&arch=x64' -OutFile 'c:\temp\Teams.msi'
write-host "Download Done"(Get-Date)
write-host "Installing Teams"(Get-Date)
Invoke-Expression -Command 'msiexec /i C:\temp\Teams.msi /quiet /l*v C:\temp\teamsinstall.log ALLUSER=1'
write-host "Waiting the 30 seconds"(Get-Date)
Start-Sleep -Seconds 30
write-host "Teams Done"(Get-Date)
Stop-Transcript
