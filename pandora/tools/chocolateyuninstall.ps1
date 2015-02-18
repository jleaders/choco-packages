$packageName = 'pandora'
$registryUninstallerKeyName = 'HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{CAC6BC93-D73B-327E-AB0C-791E74A24111}' #ensure this is the value in the registry
$installerType = 'EXE'
$silentArgs = '/S'
$validExitCodes = @(0)

$osBitness = Get-ProcessorBits
 
if ($osBitness -eq 64) {
  $file = (Get-ItemProperty -Path "hklm:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName").UninstallString
} else {
  $file = (Get-ItemProperty -Path "hklm:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName").UninstallString
} 
	
Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -SilentArgs $silentArgs -validExitCodes $validExitCodes -File $file
