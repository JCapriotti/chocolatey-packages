
$packageName = "Notepadplusplus.Settings"

try 
{
	$params = $env:chocolateyPackageParameters -split ';' | ConvertFrom-StringData
	$url = $params.url;
	$programFiles = if (${env:ProgramFiles(x86)} -ne $null) { ${env:ProgramFiles(x86)} } else { $env:ProgramFiles }
	
	if ($url -ne $null)
	{
		Write-Host "Downloading from URL $url"
		Get-ChocolateyWebFile $packageName "$env:appdata\Notepad++\config.xml" "$url/config.xml"
		Get-ChocolateyWebFile $packageName "$env:appdata\Notepad++\contextMenu.xml" "$url/contextMenu.xml"
		Get-ChocolateyWebFile $packageName "$env:appdata\Notepad++\functionList.xml" "$url/functionList.xml"
		Get-ChocolateyWebFile $packageName "$env:appdata\Notepad++\langs.xml" "$url/langs.xml"
		Get-ChocolateyWebFile $packageName "$env:appdata\Notepad++\shortcuts.xml" "$url/shortcuts.xml"
		Get-ChocolateyWebFile $packageName "$env:appdata\Notepad++\stylers.xml" "$url/stylers.xml"
		
		# Find the theme file
		$themeNode = Select-Xml -Path "$env:appdata\notepad++\config.xml" -XPath "//GUIConfig[@name='stylerTheme']"
		$themePath = $themeNode.node.path
		$themeFile = Split-Path $themePath -Leaf
		Get-ChocolateyWebFile $packageName " $programFiles\Notepad++\themes\$themeFile" "$url/$themeFile"
	}
	else 
	{
		Write-Warning "No URL specified. Try calling choco install Notepadplusplus.Settings -params 'url=http://example.com/NotepadSettings/'"
	}
	
	Write-ChocolateySuccess "$packageName"
} 
catch 
{
	Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
	throw
}
