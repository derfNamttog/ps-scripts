param ([string]$workspace = "",$orgname = "")
$workspacename = "$workspace (RD)"
$userappdata = "$env:appdata"
$appdatapath = "$userappdata\Microsoft\Windows\Start Menu\Programs\$workspacename"
$userprofile = "$env:USERProfile"
$onedrivedesktop = "$userprofile\OneDrive - $orgname\Desktop"

if (Test-Path $appdatapath) {

    if ((Test-Path $onedrivedesktop)) { 
        $ShortcutFile = "$onedrivedesktop\$workspacename.lnk" 
    } else { 
        $Shortcutfile = "$userprofile\Desktop\$workspacename.lnk"
    }

    if (!(Test-Path $ShortcutFile)) {
        $WScriptShell = New-Object -ComObject WScript.Shell
        $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
        $Shortcut.TargetPath = $appdatapath
        $Shortcut.Save()
    }

} else {
    Write-Host "Please Sign into Microsoft Remote Desktop Client and try again"
    Start-Process -FilePath "C:\Program Files\Remote Desktop\msrdcw.exe"
}