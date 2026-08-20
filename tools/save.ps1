param([string]$Message)

if ([string]::IsNullOrWhiteSpace($Message)) {
    Write-Host 'Usage: .\save.ps1 "commit message"' -ForegroundColor Yellow
    exit 1
}

$changes = git status --porcelain

if (-not $changes) {
    Write-Host 'Nothing to commit - working tree is clean.' -ForegroundColor Cyan
} else {
    git add .
    if ($LASTEXITCODE -ne 0) { exit 1 }

    git commit -m $Message
    if ($LASTEXITCODE -ne 0) { exit 1 }

    Write-Host "Committed: $Message" -ForegroundColor Green
}

git push
if ($LASTEXITCODE -ne 0) {
    Write-Host 'Push failed - check your internet connection or GitHub login.' -ForegroundColor Red
    exit 1
}

Write-Host 'Pushed to GitHub.' -ForegroundColor Green