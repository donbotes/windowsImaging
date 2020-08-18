#Create temp folder
New-Item -Path 'C:\temp' -ItemType Directory -Force | Out-Null

Start-Transcript `
-Path 'C:\temp\Languages.log' `
-IncludeInvocationHeader

#Installs the langauges in Basic Format
write-host "Languages Start"(Get-Date)
DISM.exe /Online /add-capability /CapabilityName:Language.Basic~~~de-DE~0.0.1.0
DISM.exe /Online /add-capability /CapabilityName:Language.Basic~~~es-ES~0.0.1.0
DISM.exe /Online /add-capability /CapabilityName:Language.Basic~~~fr-FR~0.0.1.0
DISM.exe /Online /add-capability /CapabilityName:Language.Basic~~~ja-JP~0.0.1.0
DISM.exe /Online /add-capability /CapabilityName:Language.Basic~~~pl-PL~0.0.1.0
DISM.exe /Online /add-capability /CapabilityName:Language.Basic~~~pt-PT~0.0.1.0
DISM.exe /Online /add-capability /CapabilityName:Language.Basic~~~ru-RU~0.0.1.0
write-host "Languages Done"(Get-Date)
Stop-Transcript