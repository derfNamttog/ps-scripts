param ([string]$workspace = "HCM-Workspace")
$workspacename = "$workspace (RD)"
$appdatapath = "$env:appdata\Microsoft\Windows\Start Menu\Programs\$workspacename"
$userdesktop = [Environment]::GetFolderPath("Desktop")
$Shortcutfile = "$userdesktop\$workspacename.lnk"

if (Test-Path $appdatapath) {

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