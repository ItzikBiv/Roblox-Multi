# RobloxMulti.ps1 - lets you run several Roblox windows at once.
# Roblox only allows one window by grabbing a named lock ("singleton") at startup.
# This script grabs that lock first and keeps it, so every Roblox window can start.
# Leave this window open while you play. Close it (or press Enter) to stop.

$names = @("ROBLOX_singletonEvent", "ROBLOX_singletonMutex")
$held = @()

if (Get-Process -Name "RobloxPlayerBeta" -ErrorAction SilentlyContinue) {
    Write-Host "Roblox is already running. Close ALL Roblox windows first, then run this again." -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

foreach ($n in $names) {
    try {
        $m = New-Object System.Threading.Mutex($true, $n)
        $held += $m
        Write-Host "Holding lock: $n" -ForegroundColor Green
    } catch {
        Write-Host "Could not take lock $n : $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Multi-instance is ON." -ForegroundColor Cyan
Write-Host "Now launch Roblox games as usual (one per account). Keep this window open."
Read-Host "Press Enter here to turn it off"

foreach ($m in $held) { try { $m.ReleaseMutex(); $m.Dispose() } catch {} }
Write-Host "Released. Bye!"
