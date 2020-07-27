#Create temp folder
New-Item -Path 'C:\timer1' -ItemType Directory -Force | Out-Null

Start-Transcript `
-Path 'C:\timer1\powershell-installation.log' `
-IncludeInvocationHeader

write-host "Starting Timer of 5 mins"
$time = get-date
write-host $time
Start-Sleep -Seconds 360
write-host "End of 5 mins"
$time = get-date
write-host $time
Stop-Transcript