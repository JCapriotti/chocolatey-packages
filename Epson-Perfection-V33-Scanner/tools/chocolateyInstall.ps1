$packageName = "Scanner Driver and EPSON Scan Utility v3.9.0.0"
$url = "https://ftp.epson.com/drivers/epson13870.exe"
$silentArgs = "/SI"
$fileType = "EXE"
$validExitCodes = @(0)

$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$file = Join-Path $unzipLocation "setup.exe"

Install-ChocolateyZipPackage $packageName $url $unzipLocation
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file
Write-Warning "$packageName requires a reboot to complete the installation."