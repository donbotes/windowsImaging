#Create temp folder
New-Item -Path 'C:\temp' -ItemType Directory -Force | Out-Null

Start-Transcript `
-Path 'C:\temp\teams.log' `
-IncludeInvocationHeader

#Install Teams
write-host "Downloading Datadog"(Get-Date)
Invoke-WebRequest -Uri 'https://statics.teams.cdn.office.net/production-windows-x64/1.3.00.21759/Teams_windows_x64.msi' -OutFile 'c:\temp\teams.msi'
write-host "Download Done"(Get-Date)
write-host "Installing Datadog"(Get-Date)
#msiexec /i 'c:\temp\teams.msi' /l*v 'C:\temp\teams-install.log' ALLUSER=1 ALLUSERS=1
Start-Process -Wait msiexec -ArgumentList '/qn /i c:\temp\teams.msi' ALLUSER=1 ALLUSERS=1
write-host "Waiting the 120 seconds"(Get-Date)
Start-Sleep -Seconds 120
write-host "Datadog Done"(Get-Date)
Stop-Transcript
