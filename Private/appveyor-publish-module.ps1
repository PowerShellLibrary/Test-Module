$myModulePath = (Get-Item .).FullName
$modulesPath = $env:PSModulePath -split ";" | Select-Object -First 1

Copy-Item -Path $myModulePath -Destination $modulesPath -Recurse

Publish-Module -Name Test-Module -NuGetApiKey $env:NuGetApiKey