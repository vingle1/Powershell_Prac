Write-Host "Simple Powershell Script" 

$greeting = "Hello"
#$name = "Airman"

$name = Read-Host "Please enter your name"

function Say-Hello {
    param($userName)
    Write-Host "$greeting, $userName!"

}

Say-Hello $name

function Show-OSInfo {
    $os = Get-CimInstance Win32_OperatingSystem
    Write-Host "Operating system: $($os.Caption)"
    Write-Host "Version: $($os.Version)"
    Write-Host "Architecture: $($os.OSArchitecture)"
}

function Show-PSVersion {
    Write-Host "Powershell Version: $($PSVersionTable.PSVersion)"

}

function Show-UserInfo {
    $user = Get-CimInstance Win32_ComputerSystem
    Write-Host "User Name: $($user.UserName)"
    Write-Host "Domain: $($user.Domain)"
}

function Show-Menu {
#Clear-Host
Write-Host "===================="
Write-Host " System Information Menu"
Write-Host "===================="
Write-Host "1. Show Operating system Info"
Write-Host "2. Show Powershell Version"
Write-Host "3. Show User Information"
Write-Host "4. Exit"

}

do{
    Show-Menu
    $choice = Read-Host "Please select an option (1-4)"

    switch ($choice){
        1 { Show-OSInfo }
        2 { Show-PSVersion }
        3 { Show-UserInfo }
        4 { Write-Host "Exiting..."; break }
        default { Write-Host "Invalid selection , please try again." }

    }

    Read-Host "Press Enter to continue..."
} while ($true)
