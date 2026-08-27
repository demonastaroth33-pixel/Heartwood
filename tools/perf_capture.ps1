# tools/perf_capture.ps1 - standard on-target-machine measurement flow.
# Run on the target laptop, in the same Chrome profile the diagnostics were
# captured in. Rebuilds, opens the app with DevTools, and tells you what to
# paste back to the opencode session to resume the perf pipeline.
#
# NOTE: ASCII-only on purpose - PowerShell 5.1 parses .ps1 as ANSI and
# non-ASCII characters (em-dashes etc.) break the parser.
#
# Usage: powershell -File tools/perf_capture.ps1

# Run from the repo root regardless of where it's launched from.
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptDir
Push-Location $repoRoot

Write-Host "== Heartwood perf capture ==" -ForegroundColor Cyan
Write-Host "1. Rebuilding release web build..." -ForegroundColor Yellow
flutter build web --release
if ($LASTEXITCODE -ne 0) { Write-Host "Build failed - aborting." -ForegroundColor Red; Pop-Location; exit 1 }

Write-Host "2. Starting static server on :8080..." -ForegroundColor Yellow
$existing = Get-NetTCPConnection -LocalPort 8080 -State Listen -ErrorAction SilentlyContinue
if ($existing) {
  $pidToKill = $existing.OwningProcess | Select-Object -First 1
  Stop-Process -Id $pidToKill -Force -ErrorAction SilentlyContinue
  Start-Sleep 1
}
Start-Process -WindowStyle Hidden node -ArgumentList "tools/serve_web.mjs","build/web","8080"
Start-Sleep 2

Write-Host "3. Opening Chrome with DevTools on the app..." -ForegroundColor Yellow
Start-Process "chrome.exe" "--auto-open-devtools-for-tabs http://localhost:8080"

Write-Host ""
Write-Host "4. In the opened Chrome window:" -ForegroundColor Cyan
Write-Host "   - Wait for the app to load (splash -> dashboard)."
Write-Host "   - Interact for ~30s: hover across cards, open the compose (plus),"
Write-Host "     open a habit card, close it, tick a habit."
Write-Host "   - Leave the app untouched for ~30s (idle measurement)."
Write-Host ""
Write-Host "5. Copy back into the opencode session:" -ForegroundColor Cyan
Write-Host "   - every [heartwood-frames] line from the Console"
Write-Host "   - the [heartwood] prefers-reduced-motion/webgl2/renderer line"
Write-Host "   - the drift storage line (Using WasmStorageImplementation...)"
Write-Host "   - if asked (T1): the Performance-panel summary of a slow window"
Write-Host "   - if asked (T2): the chrome://gpu WebGL2 blocklist line"
Write-Host ""
Write-Host "Paste both blocks to resume the pipeline."
Pop-Location