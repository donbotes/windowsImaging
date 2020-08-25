#Create temp folder
New-Item -Path 'C:\temp' -ItemType Directory -Force | Out-Null

Start-Transcript `
-Path 'C:\temp\optimization.log' `
-IncludeInvocationHeader


#Optimizations
write-host "Downloading Optimizations"(Get-Date)
Invoke-WebRequest -Uri 'https://github.com/donbotes/windowsImaging/raw/master/Opt.zip' -OutFile 'c:\temp\Opt.zip'
write-host "Download Done"(Get-Date)
write-host "Extracting Optimizations"(Get-Date)
Expand-Archive -Path 'C:\temp\Opt.zip' -DestinationPath 'C:\temp\' -Force
write-host "Extract Done"(Get-Date)
Set-ExecutionPolicy RemoteSigned -Force
write-host "Optimizing..."(Get-Date)
Invoke-Expression -Command 'C:\temp\Opt\Win10_WVD_Optimize.ps1' 
Set-ExecutionPolicy Restricted -Force
Stop-Transcript
