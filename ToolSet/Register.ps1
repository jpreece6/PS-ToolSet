#
# Register.ps1
#

# GLOBALS
$EXTS = "*.dll", "*.ocx"

Get-ChildItem -Path "D:\test\*" -Include $EXTS |
ForEach-Object {
	cmd /c regsvr32 /s $_.FullName
	if ($?) {
		Write-Host -NoNewline -ForegroundColor Green "$($_.Name)"
		Write-Host " registered correctly."
	} else {
		Write-Host -NoNewline -ForegroundColor Red "$($_.Name)"
		Write-Host " failed to register. ($LASTEXITCODE)"
	}
}

cmd /c pause
