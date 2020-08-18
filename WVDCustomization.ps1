#Create temp folder
New-Item -Path 'C:\temp' -ItemType Directory -Force | Out-Null

Start-Transcript `
-Path 'C:\temp\WVDCustomization.log' `
-IncludeInvocationHeader

#Make Windows Defender skip scanning the VHD
write-host "Windows Defender Skip Scanning .VHDX"(Get-Date)
Add-MpPreference -ExclusionExtension ".VHDX"

#Disable Automatic Updates
write-host "Disable Automatic Updates"(Get-Date)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f

#Specify Start layout for Windows 10 PCs
write-host "Specify Start Layout"(Get-Date)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SpecialRoamingOverrideAllowed /t REG_DWORD /d 1 /f

#Time Zone Redirection
write-host "Time Zone Redirection"(Get-Date)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v fEnableTimeZoneRedirection /t REG_DWORD /d 1 /f

#Disable Windows Storage Sence
write-host "Disable Storage Sence"(Get-Date)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v 01 /t REG_DWORD /d 0 /f

#Other Applications and Registry Configurations
#Feedback hub collection of telementry data
write-host "Feedback hub collection"(Get-Date)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 3 /f

#Fix Watson Crashes
write-host "Fix Watson Crashes"(Get-Date)
reg delete "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v CorporateWerServer* /f

#Fix 5k resolution support
write-host "Fix 5k resolution support"(Get-Date)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v MaxMonitors /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v MaxXResolution /t REG_DWORD /d 5120 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v MaxYResolution /t REG_DWORD /d 2880 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\rdp-sxs" /v MaxMonitors /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\rdp-sxs" /v MaxXResolution /t REG_DWORD /d 5120 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\rdp-sxs" /v MaxYResolution /t REG_DWORD /d 2880 /f
write-host "Done with WVD Customization"(Get-Date)
