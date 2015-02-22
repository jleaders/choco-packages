$packageName = 'winlocate' # arbitrary name for the package, used in messages
$registryUninstallerKeyName = 'winlocate' #ensure this is the value in the registry
$installerType = 'zip' #only one of these: exe, msi, msu
$url = 'http://colocrossing.dl.sourceforge.net/project/winlocate/Winlocate/0.1.6/winlocate-0.1.6.zip' # download url
#$url64 = '' # 64bit URL here or remove - if installer decides, then use $url
$silentArgs = '' # "/s /S /q /Q /quiet /silent /SILENT /VERYSILENT" # try any of these to get the silent installer #msi is always /quiet
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
#$installDir = "${env:ProgramFiles(x86)}/winlocate/"
$binRoot = Get-BinRoot
$filename = split-path "$url" -leaf
$filename = [io.path]::GetFileNameWithoutExtension($filename)
$installDir = Join-Path $binRoot "$packageName"
Install-ChocolateyZipPackage "$packageName" "$url" "$installDir"
$result = Start-Process "$installDir/$filename/Install.bat"
Write-Host "You can use Updatedb.bat -a now and then Locate.bat (you may have to restart your shell)"