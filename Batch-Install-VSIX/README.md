Chocolatey-Batch-Install-VSIX
=============================

Installs VSIX extensions provided by an XML configuration file.

Configuration File
-------------------

```xml
<extensions>
  <extension name="SpecFlow for Visual Studio 2013" version="12" url="http://visualstudiogallery.msdn.microsoft.com/90ac3587-7466-4155-b591-2cd4cc4401bc/file/112721/3/TechTalk.SpecFlow.Vs2013Integration.vsix" />
  <extension name="Indent Guides" version="12" url="http://visualstudiogallery.msdn.microsoft.com/e792686d-542b-474a-8c55-630980e72c30/file/48932/19/IndentGuide%20v14.vsix" /> 
</extensions>
```

The attribtes name, version, and url correspond to the helper `Install-ChocolateyVsixPackage` parameters.
* _name_ is arbitrary.
* _version_ is the major version of Visual Studio where the 
package should be installed.
* _url_ is the URL of the VSIX file.


Usage Example
----- 
```
cinst batch-install-vsix -params 'c:\temp\extensions.config' 
```

Since this package installs a dynamic set of VSIX packages, you may need to run it multiple times and will want to use the force switch:
```
cinst batch-install-vsix -params 'c:\temp\extensions.config' -force
```

