param(
  [string]$Root = (Split-Path -Parent $PSScriptRoot)
)
$ErrorActionPreference = 'Stop'
$dist = Join-Path $Root 'dist'
$lines = Get-ChildItem -LiteralPath $dist -File -Filter '*.zip' | Sort-Object Name | ForEach-Object {
  $hash = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
  "$hash  $($_.Name)"
}
$lines | Set-Content -LiteralPath (Join-Path $Root 'SHA256SUMS.txt') -Encoding ascii
$lines
