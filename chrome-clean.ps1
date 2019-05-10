$Items = @('Cache\*',
            'Cookies',
            'History',
)
$Folder = "$($env:LOCALAPPDATA)\Google\Chrome\User Data\Default"
$Items | Foreach-Object { 
    if (Test-Path "$Folder\$_") {
        Remove-Item "$Folder\$_" 
    }
}