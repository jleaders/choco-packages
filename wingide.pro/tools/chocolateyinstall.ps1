$packageName = 'wingide.pro' # arbitrary name for the package, used in messages
$registryUninstallerKeyName = 'Wing IDE 5.1_is1' #ensure this is the value in the registry
$installerType = 'exe' #only one of these: exe, msi, msu
$url = 'http://wingware.com/pub/wingide/5.1.1/wingide-5.1.1-1.exe' # download url
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # "/s /S /q /Q /quiet /silent /SILENT /VERYSILENT" # try any of these to get the silent installer #msi is always /quiet
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"
