#NOTE: Please remove any commented lines to tidy up prior to releasing the package, including this one


$packageName = 'pandora' # arbitrary name for the package, used in messages
$url = 'http://www.pandora.com/static/desktop_app/pandora_2_0_9.air' # download url
$fileName = split-path "$url" -leaf

# Method 1: By hand.
Get-ChocolateyWebFile 'pandora' "$env:TEMP/$fileName" "$url"
$result = Start-Process "$env:TEMP/$fileName" -Wait

# Method 2: Silent install. (Seems to fail, but I can't find documentation on this program)
#$AirInstaller = "C:\Program Files (x86)\Adobe\Flash Player\AddIns\airappinstaller\airappinstaller.exe"
#$result = Start-Process -filepath "$AirInstaller" -ArgumentList " -euleAccepted -programMenu $env:TEMP\$fileName" -Wait

# Method 3: APK
# See: https://www.adobe.com/devnet/air/articles/air3-install-and-deployment-options.html

#TODO: Check $result and write to Chocolatey the result.
