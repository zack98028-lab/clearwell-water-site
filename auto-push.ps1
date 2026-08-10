# Clearwell Water Filtration - Auto-Push Watcher
# Watches this folder and pushes any change straight to the live site.

$folder = Split-Path -Parent $MyInvocation.MyCommand.Path
$gitPath = "C:\Program Files\Git\cmd\git.exe"

Write-Host "Watching for changes in: $folder" -ForegroundColor Green
Write-Host "Any file you save goes live on clearwellwaterfiltration.com" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop.`n" -ForegroundColor Yellow

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $folder
$watcher.Filter = "*.*"
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

$action = {
    $name = $Event.SourceEventArgs.Name

    # Ignore git internals, this script, and editor temp files
    if ($name -match "^\.git|auto-push|\.ps1$|\.bat$|~$|\.tmp$|\.swp$") { return }

    Start-Sleep -Seconds 2   # let multi-file saves settle

    Write-Host "`nChange detected: $name" -ForegroundColor Yellow
    Write-Host "Pushing to live website..." -ForegroundColor Cyan

    Set-Location $folder
    & $gitPath add -A 2>$null
    $status = & $gitPath status --porcelain
    if ($status) {
        & $gitPath commit -m "Update site: $name changed" 2>&1 | Out-Null
        & $gitPath push origin main 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Live! Changes are on clearwellwaterfiltration.com in about a minute." -ForegroundColor Green
        } else {
            Write-Host "Push failed. Check your internet connection, then save the file again." -ForegroundColor Red
        }
    } else {
        Write-Host "No changes to push." -ForegroundColor Gray
    }
}

Register-ObjectEvent $watcher "Changed" -Action $action | Out-Null
Register-ObjectEvent $watcher "Created" -Action $action | Out-Null
Register-ObjectEvent $watcher "Deleted" -Action $action | Out-Null
Register-ObjectEvent $watcher "Renamed" -Action $action | Out-Null

while ($true) { Start-Sleep -Seconds 5 }
