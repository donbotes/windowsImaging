#Create temp folder
New-Item -Path 'C:\temp' -ItemType Directory -Force | Out-ullN

#Chrome
write-host "Installing Chrome"
Invoke-WebRequest -Uri 'https://dl.google.com/tag/s/appguid%253D%257B8A69D345-D564-463C-AFF1-A69D9E530F96%257D%2526iid%253D%257BBEF3DB5A-5C0B-4098-B932-87EC614379B7%257D%2526lang%253Den%2526browser%253D4%2526usagestats%253D1%2526appname%253DGoogle%252520Chrome%2526needsadmin%253Dtrue%2526ap%253Dx64-stable-statsdef_1%2526brand%253DGCEB/dl/chrome/install/GoogleChromeEnterpriseBundle64.zip?_ga%3D2.8891187.708273100.1528207374-1188218225.1527264447' -OutFile 'c:\temp\chrome.zip'
Start-Sleep -Seconds 10
Expand-Archive -Path 'C:\temp\chrome.zip' -DestinationPath 'C:\temp\chrome\'  -Force
Invoke-Expression -Command 'C:\temp\chrome\Installers\GoogleChromeStandaloneEnterprise64.msi /qn'
Start-Sleep -Seconds 120