#NOTE: Please remove any commented lines to tidy up prior to releasing the package, including this one

# stop on all errors
$ErrorActionPreference = 'Stop';
$packageName = 'jira-client' # arbitrary name for the package, used in messages
$registryUninstallerKeyName = 'jira-client' #ensure this is the value in the registry
$installerType = 'exe' #only one of these: exe, msi, msu
$url = 'http://d1.almworks.com/.files/jiraclient-3_6_2.exe' # download url
$silentArgs = '/s /S /q /Q /quiet /silent /SILENT /VERYSILENT' # "/s /S /q /Q /quiet /silent /SILENT /VERYSILENT" # try any of these to get the silent installer #msi is always /quiet
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"

