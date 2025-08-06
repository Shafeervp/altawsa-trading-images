Get-ChildItem -File | ForEach-Object {
    $oldName = $_.Name
    $newName = $_.BaseName.ToLower().Replace(' ', '-') + $_.Extension
    if ($newName -ne $oldName) {
        Rename-Item -Path $_.FullName -NewName $newName
        Write-Host "Renamed '$oldName' to '$newName'"
    } else {
        Write-Host "Skipping '$oldName' (already formatted correctly)"
    }
}
