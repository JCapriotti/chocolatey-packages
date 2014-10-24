
$packageName = "NuGet.ContextMenu"

try 
{
	New-PSDrive -PSProvider registry -Root HKEY_CLASSES_ROOT -Name HKCR
	$key = "HKCR:\nuspec_auto_file\shell\NuGet Pack\command"
	New-Item "HKCR:\nuspec_auto_file\shell" -Name "NuGet Pack" -Force
	New-Item "HKCR:\nuspec_auto_file\shell\NuGet Pack" -Name "command"  -Force
	Set-Item $key -Value "cmd /c nuget pack ""%1""" -Force
	Write-ChocolateySuccess "$packageName"
} 
catch 
{
	Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
	throw
}
