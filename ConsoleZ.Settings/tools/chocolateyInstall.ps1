
$packageName = "ConsoleZ.Settings"

try 
{
	$params = $env:chocolateyPackageParameters -split ';' | ConvertFrom-StringData
	$url = $params.url;
	
	if ($url -ne $null)
	{
		Write-Host "Downloading from URL $url"
		Get-ChocolateyWebFile $packageName "$env:appdata\console\console.xml" $url
	}
	else 
	{
		Write-Warning "No URL specified. Try calling choco install ConsoleZ.Settings -params 'url=http://example.com'"
	}
	
	Write-ChocolateySuccess "$packageName"
} 
catch 
{
	Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
	throw
}
