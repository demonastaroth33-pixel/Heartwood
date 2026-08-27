param(
    [int]$Port = 8080,
    [string]$BuildDir = 'build/web'
)

$root = Split-Path $PSScriptRoot -Parent
$server = Join-Path $PSScriptRoot 'serve_web.mjs'

$conn = Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue
foreach ($c in $conn) {
    Stop-Process -Id $c.OwningProcess -Force -ErrorAction SilentlyContinue
}

Start-Process -FilePath 'node' -ArgumentList "`"$server`"",$BuildDir,$Port -WorkingDirectory $root -WindowStyle Hidden
Start-Sleep 2

$r = Invoke-WebRequest -Uri "http://localhost:$Port" -UseBasicParsing -TimeoutSec 10
if ($r.StatusCode -eq 200) {
    Write-Host "Web server up on http://localhost:$Port" -ForegroundColor Green
    Start-Process "http://localhost:$Port"
    exit 0
}

Write-Host "Server responded with HTTP $($r.StatusCode)" -ForegroundColor Red
exit 1