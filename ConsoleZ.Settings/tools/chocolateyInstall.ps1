
$packageName = "ConsoleZ.Settings"

try 
{
	Write-Debug "chocolateyPackageParameters: $env:chocolateyPackageParameters"
	$params = $env:chocolateyPackageParameters -split ';' | ConvertFrom-StringData
	Write-Debug "params: $params"
	$url = $params.url;
	Write-Debug "url: $url"
	
	if ($url)
	{
		Write-Host "Downloading from URL $url"
		New-Item "$env:appdata\console" -Type Directory -Force
		Get-ChocolateyWebFile $packageName "$env:appdata\console\console.xml" $url
	}
	else 
	{
		throw "No URL specified. Try calling choco install ConsoleZ.Settings -params 'url=http://example.com'"
	}
	Write-ChocolateySuccess "$packageName"
} 
catch 
{
	Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
	throw
}
