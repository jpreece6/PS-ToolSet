#
# Name: UnRegister.ps1
# Author: Josh Preece
# Description: Script to un-register (ActiveX) .dll and .ocx files using regsvr32
#

# GLOBALS
$EXTS = "*.dll", "*.ocx"

# Return the execution directory of this script
function Get-ScriptDirectory
{
	$Invocation = (Get-Variable MyInvocation -Scope 1).Value
	Split-Path $Invocation.MyCommand.Path
}

# Filter for all .dll and .ocx files to de-register them using regsvr23
Get-ChildItem -Path "$(Get-ScriptDirectory)\*" -Include $EXTS |
ForEach-Object {
	cmd /c regsvr32 /s $_.FullName
	if ($?) {
		Write-Host -NoNewline -ForegroundColor Green "$($_.Name)"
		Write-Host " de-registered correctly."
	} else {
		Write-Host -NoNewline -ForegroundColor Red "$($_.Name)"
		Write-Host " failed to de-register. ($LASTEXITCODE)"
	}
}

cmd /c pause #| out-null
