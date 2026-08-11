param(
  [string]$Path = "C:\Users\dell\Desktop\Tests",
  [string[]]$Extensions = @("*.jpeg", "*.jpg", "*.png")
)

# Windows OCR for screenshots. PowerShell 5.1 cannot call generic methods,
# so AsTask<T> is invoked via reflection. Run: powershell -File ocr_screenshots.ps1 -Path <dir>
[Windows.Media.Ocr.OcrEngine,Windows.Foundation,ContentType=WindowsRuntime] | Out-Null
[Windows.Storage.StorageFile,Windows.Storage,ContentType=WindowsRuntime] | Out-Null
[Windows.Storage.FileAccessMode,Windows.Storage,ContentType=WindowsRuntime] | Out-Null
[Windows.Graphics.Imaging.BitmapDecoder,Windows.Graphics,ContentType=WindowsRuntime] | Out-Null
Add-Type -AssemblyName System.Runtime.WindowsRuntime

$asTaskDef = [System.WindowsRuntimeSystemExtensions].GetMethods() |
  Where-Object { $_.Name -eq 'AsTask' -and $_.GetGenericArguments().Count -eq 1 -and $_.GetParameters().Count -eq 1 } |
  Select-Object -First 1

function Await([Type]$t, $op) {
  $m = $asTaskDef.MakeGenericMethod($t)
  $m.Invoke($null, @($op)).GetAwaiter().GetResult()
}

$engine = [Windows.Media.Ocr.OcrEngine]::TryCreateFromUserProfileLanguages()
if ($null -eq $engine) { Write-Error "No OCR language pack installed"; exit 1 }

foreach ($ext in $Extensions) {
  foreach ($f in Get-ChildItem $Path -Filter $ext) {
    try {
      $file = Await ([Windows.Storage.StorageFile]) ([Windows.Storage.StorageFile]::GetFileFromPathAsync($f.FullName))
      $stream = Await ([Windows.Storage.Streams.IRandomAccessStream]) ($file.OpenAsync([Windows.Storage.FileAccessMode]::Read))
      $decoder = Await ([Windows.Graphics.Imaging.BitmapDecoder]) ([Windows.Graphics.Imaging.BitmapDecoder]::CreateAsync($stream))
      $bitmap = Await ([Windows.Graphics.Imaging.SoftwareBitmap]) ($decoder.GetSoftwareBitmapAsync())
      $result = Await ([Windows.Media.Ocr.OcrResult]) ($engine.RecognizeAsync($bitmap))
      "===FILE=== $($f.Name)"
      $result.Text
      $stream.Dispose()
    } catch {
      "===FILE=== $($f.Name) OCR_ERROR: $($_.Exception.Message)"
    }
  }
}
