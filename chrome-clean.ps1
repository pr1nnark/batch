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
# the following can also be added to $Items, depending on what you wish to wipe:
# 'Archived History', 'Login Data', 'Top Sites', 'Visited Links', 'Web Data'
