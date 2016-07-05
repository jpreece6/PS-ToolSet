#
# UnRegister.ps1
#

$exts = "*.dll", "*.ocx"

Get-ChildItem -Path "D:\test\*" -Include $exts |
ForEach-Object {
	cmd /c regsvr32 /s $_.FullName
	if ($?) {
		"$($_.Name) de-registered correctly."
	} else {
		"$($_.Name) failed to de-register. ($LASTEXITCODE)"
	}
}

cmd /c pause #| out-null
