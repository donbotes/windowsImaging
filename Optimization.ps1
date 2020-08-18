#Create temp folder
New-Item -Path 'C:\temp' -ItemType Directory -Force | Out-Null

Start-Transcript `
-Path 'C:\temp\optimization.log' `
-IncludeInvocationHeader


#Optimizations
write-host "Downloading Optimizations"(Get-Date)
Invoke-WebRequest -Uri 'https://github.com/donbotes/windowsImaging/raw/master/Optimizations.zip' -OutFile 'c:\temp\Optimizations.zip'
write-host "Download Done"(Get-Date)
write-host "Extracting Optimizations"(Get-Date)
Expand-Archive -Path 'C:\temp\Optimizations.zip' -DestinationPath 'C:\temp\' -Force
write-host "Extract Done"(Get-Date)
write-host "Optimizing..."(Get-Date)
Invoke-Expression -Command 'C:\temp\Optimizations\Virtual-Desktop-Optimization-Tool-master\Win10_VirtualDesktop_Optimize.ps1' 
Stop-Transcript
