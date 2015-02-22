#NOTE: Please remove any commented lines to tidy up prior to releasing the package, including this one


$packageName = 'glovepie' # arbitrary name for the package, used in messages
$registryUninstallerKeyName = 'glovepie' #ensure this is the value in the registry
$installerType = 'zip' #only one of these: exe, msi, msu
$url = 'http://www.glovepie.org/GlovePIE045Free.zip' # download url
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$binRoot = Get-BinRoot
$installDir = Join-Path $binRoot "$packageName"
Write-Host "Adding `'$installDir`' to the path and the current shell path"
Install-ChocolateyPath "$installDir"
$env:Path = "$($env:Path);$installDir"
Install-ChocolateyZipPackage "$packageName" "$url" "$installDir"

