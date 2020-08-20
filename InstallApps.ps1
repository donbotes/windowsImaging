#Create temp folder
New-Item -Path 'C:\temp' -ItemType Directory -Force | Out-Null

Start-Transcript `
-Path 'C:\temp\powershell-installation.log' `
-IncludeInvocationHeader


#Chrome
write-host "Downloading Chrome"(Get-Date)
Invoke-WebRequest -Uri 'https://dl.google.com/tag/s/appguid%253D%257B8A69D345-D564-463C-AFF1-A69D9E530F96%257D%2526iid%253D%257BBEF3DB5A-5C0B-4098-B932-87EC614379B7%257D%2526lang%253Den%2526browser%253D4%2526usagestats%253D1%2526appname%253DGoogle%252520Chrome%2526needsadmin%253Dtrue%2526ap%253Dx64-stable-statsdef_1%2526brand%253DGCEB/dl/chrome/install/GoogleChromeEnterpriseBundle64.zip?_ga%3D2.8891187.708273100.1528207374-1188218225.1527264447' -OutFile 'c:\temp\chrome.zip'
write-host "Download Done"(Get-Date)
write-host "Extracting Chrome"(Get-Date)
Expand-Archive -Path 'C:\temp\chrome.zip' -DestinationPath 'C:\temp\chrome\'  -Force
write-host "Extract Done"(Get-Date)
write-host "Installing Chrome"(Get-Date)
Invoke-Expression -Command 'C:\temp\chrome\Installers\GoogleChromeStandaloneEnterprise64.msi /qn'
write-host "Waiting the 120 seconds"(Get-Date)
Start-Sleep -Seconds 120
write-host "Chrome Done"(Get-Date)

#InstallFSLogix
write-host "Downloading FSLogix"(Get-Date)
Invoke-WebRequest -Uri 'https://aka.ms/fslogix_download' -OutFile 'c:\temp\fslogix.zip'
write-host "Download Done"
write-host "Extracting FSLogix"(Get-Date)
Expand-Archive -Path 'C:\temp\fslogix.zip' -DestinationPath 'C:\temp\fslogix\'  -Force
write-host "Extract Done"(Get-Date)
write-host "Installing FSLogix"(Get-Date)
C:\temp\fslogix\x64\Release\FSLogixAppsSetup.exe /install /quiet /norestart
write-host "Waiting the 120 seconds"(Get-Date)
Start-Sleep -Seconds 120
write-host "FSLogix Done"(Get-Date)

#Install Datadog
write-host "Downloading Datadog"(Get-Date)
Invoke-WebRequest -Uri 'https://s3.amazonaws.com/ddagent-windows-stable/datadog-agent-7-latest.amd64.msi' -OutFile 'c:\temp\datadog.msi'
write-host "Download Done"(Get-Date)
write-host "Installing Datadog"(Get-Date)
Start-Process -Wait msiexec -ArgumentList '/qn /i C:\temp\datadog.msi APIKEY="some1fake1key1here1"'
write-host "Waiting the 120 seconds"(Get-Date)
Start-Sleep -Seconds 120
write-host "Datadog Done"(Get-Date)
Stop-Transcript
