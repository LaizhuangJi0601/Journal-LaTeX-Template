param(
  [string]$Root = (Split-Path -Parent $PSScriptRoot)
)
$ErrorActionPreference = 'Stop'
$templates = Join-Path $Root 'templates'
$dist = Join-Path $Root 'dist'
if (-not (Test-Path -LiteralPath $templates)) { throw "templates not found: $templates" }
New-Item -ItemType Directory -Force -Path $dist | Out-Null
Get-ChildItem -LiteralPath $templates -Directory | ForEach-Object {
  $name = $_.Name
  $zip = Join-Path $dist ("$name.zip")
  if (Test-Path -LiteralPath $zip) { Remove-Item -LiteralPath $zip -Force }
  Compress-Archive -Path (Join-Path $_.FullName '*') -DestinationPath $zip -CompressionLevel Optimal
  "packed: $name.zip"
}
