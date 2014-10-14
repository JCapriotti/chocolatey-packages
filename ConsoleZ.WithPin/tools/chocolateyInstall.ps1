
$packageName = "ConsoleZ.WithPin"

try 
{
	$myToolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition
	$lib = (Get-Item $myToolsPath).Parent.Parent.FullName
	$consoleZPath = Join-Path $lib "\ConsoleZ.1.12.0.14282\tools\console.exe"

	Install-ChocolateyPinnedTaskBarItem $consoleZPath
	
	Write-ChocolateySuccess "$packageName"
} 
catch 
{
	Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
	throw
}
