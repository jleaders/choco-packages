$packageName = 'skype.desktop' # arbitrary name for the package, used in messages
$registryUninstallerKeyName = '{24991BA0-F0EE-44AD-9CC8-5EC50AECF6B7}' #ensure this is the value in the registry
$installerType = 'exe' #only one of these: exe, msi, msu
$url = 'http://download.skype.com/0dce4e856bdf8239787df5c367298d54/SkypeSetup.exe' # download url
#$url = 'http://www.skype.com/go/getskype'
#$url64 = '' # 64bit URL here or remove - if installer decides, then use $url
$silentArgs = '/silent' # "/s /S /q /Q /quiet /silent /SILENT /VERYSILENT" # try any of these to get the silent installer #msi is always /quiet
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"
