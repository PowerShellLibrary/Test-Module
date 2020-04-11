$moduleName     = $env:ModuleName
$modulesPath    = $env:PSModulePath -split ";" | Select-Object -First 1
$source         = (Get-Item .).FullName
$exclude        = @('.git', 'README.md', "ci\\*") # "ci\\.*.ps1"

mkdir "$modulesPath\$moduleName" | Out-Null
$modulesPath = "$modulesPath\$moduleName"

Get-ChildItem -Recurse | ? {
    $path = $_.FullName
    $filter = $exclude | ? { $path -match $_  }
    $filter.Count -eq 0
 } | Copy-Item -Destination { Join-Path $modulesPath $_.FullName.Substring($source.length) }

Publish-Module -Name Test-Module -NuGetApiKey $env:NuGetApiKey