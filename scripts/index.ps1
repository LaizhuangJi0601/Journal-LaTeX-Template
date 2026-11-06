param(
  [string]$Root = (Split-Path -Parent $PSScriptRoot)
)
$ErrorActionPreference = 'Stop'
$templates = Join-Path $Root 'templates'
$dist = Join-Path $Root 'dist'
$list = @()
foreach ($dir in Get-ChildItem -LiteralPath $templates -Directory | Sort-Object Name) {
  $manifestPath = Join-Path $dir.FullName 'manifest.json'
  if (-not (Test-Path -LiteralPath $manifestPath)) { continue }
  $m = Get-Content -LiteralPath $manifestPath -Raw -Encoding utf8 | ConvertFrom-Json
  $zip = Join-Path $dist ("$($dir.Name).zip")
  if (-not (Test-Path -LiteralPath $zip)) { continue }
  $hash = (Get-FileHash -LiteralPath $zip -Algorithm SHA256).Hash.ToLowerInvariant()
  $list += [ordered]@{
    name = $m.name
    file = "dist/$($dir.Name).zip"
    entry = $m.entry
    scope = $m.scope
    publisher = $m.publisher
    license = $m.license
    source = $m.source
    sha256 = $hash
    size = (Get-Item -LiteralPath $zip).Length
  }
}
$index = [ordered]@{
  schemaVersion = 1
  updated = (Get-Date -Format 'yyyy-MM-dd')
  templates = $list
}
$index | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath (Join-Path $Root 'index.json') -Encoding utf8
"index.json: $($list.Count) templates"
