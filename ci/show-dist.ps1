$source         = (Get-Item .).FullName
$exclude        = @('.git', 'README.md')
$filteredOutput = (Get-ChildItem $source -Recurse -Exclude $exclude).FullName | Sort-Object -Property Length

$allArtifacts = (Get-ChildItem -Path $source -Recurse).FullName
Compare-Object -ReferenceObject $allArtifacts -DifferenceObject $filteredOutput