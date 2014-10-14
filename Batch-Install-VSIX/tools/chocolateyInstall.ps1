
try {
	$packageName = "Batch Install VSIX"
	$configFilePath = $env:chocolateyPackageParameters
	
	if (-not([string]::IsNullOrEmpty($configFilePath)) -and(Test-Path $configFilePath)) {
		[xml]$extensions = Get-Content $configFilePath
		
		foreach ($extension in $extensions.extensions.extension) {
			Install-ChocolateyVsixPackage $extension.name $extension.url $extension.version
		}
	    Write-ChocolateySuccess $packageName
	}
	else {
		Write-ChocolateyFailure $packageName "Must specify a valid XML configuration file"
	}
} catch {
	Write-ChocolateyFailure $packageName $($_.Exception.Message)
	throw
}
