#Create temp folder
New-Item -Path 'C:\temp' -ItemType Directory -Force | Out-Null

#InstallFSLogix
write-host "Installing FSLogix"
Invoke-WebRequest -Uri 'https://aka.ms/fslogix_download' -OutFile 'c:\temp\fslogix.zip'
Start-Sleep -Seconds 10
Expand-Archive -Path 'C:\temp\fslogix.zip' -DestinationPath 'C:\temp\fslogix\'  -Force
C:\temp\fslogix\x64\Release\FSLogixAppsSetup.exe /install /quiet /norestart
Start-Sleep -Seconds 120