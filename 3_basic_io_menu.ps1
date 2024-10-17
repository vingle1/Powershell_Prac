Write-Host "Simple Powershell Script" 

$greeting = "Hello"
#$name = "Airman"

$name = Read-Host "Please enter your name"

function Say-Hello {
    param($userName)
    Write-Host "$greeting, $userName!" -ForegroundColor Green

}

Say-Hello $name

function Show-OSInfo {
    try{
    $os = Get-CimInstance Win32_OperatingSystem
    Write-Host "Operating system: $($os.Caption)"
    Write-Host "Version: $($os.Version)"
    Write-Host "Architecture: $($os.OSArchitecture)"
    } 
    catch {
            Write-Host "Unable get that information, due to an error."
    }

}

function Show-PSVersion {
    Write-Host "Powershell Version: $($PSVersionTable.PSVersion)"

}

function Show-UserInfo {
    try{
    $user = Get-CimInstance Win32_ComputerSystem
    Write-Host "User Name: $($user.UserName)"
    Write-Host "Domain: $($user.Domain)"
    }
    catch {
            Write-Host "Unable to get user information"
    }
}

function Show-IPInfo {
    try{
    $ipInfo = Get-NetIPAddress | Where-Object { $_.AddressFamily -eq 'IPv4' }
    if ($ipInfo){
        Write-Host "IP Address Information:"
        $ipInfo | ForEach-Object {
            Write-Host "Interface: $($_.InterfaceAlias) - IP Address: $($_.IPAddress)"
        }

    } else {
            Write-Host "Cannot find the IP address informationn"
        }
        }
        catch {
                Write-Host "Unable to get IP address information due to unknown error"
        }
}

function show-FileHash {
    $filePath = Read-Host "Specify the full file path"
    if(Test-Path $filePath) {
        $hash = Get-FileHash -Path $filePath
        Write-Host "File: $($hash.Path)"
        Write-Host "Hash Algorith: $($hash.Algorithm)"
        Write-Host "Hash: $($hash.Hash)"
    } 
    else {
        Write-Host "This file does not exist or the path you entered is incorrect" -ForegroundColor DarkRed
    }
}

function Show-Menu {
Clear-Host
Say-Hello $name
Write-Host "=========================="
Write-Host " System Information Menu"
Write-Host "=========================="
Write-Host "1. Show Operating system Info"
Write-Host "2. Show Powershell Version"
Write-Host "3. Show User and Domain Information"
Write-Host "4. Show all the IPV4 addresses associated with this computer"
Write-Host "5. Show file hash"
Write-Host "6. Exit"

}

do{
    Show-Menu
    $choice = Read-Host "Please select an option (1-5)"

    switch ($choice){
        1 { Show-OSInfo }
        2 { Show-PSVersion }
        3 { Show-UserInfo }
        4 { Show-IPInfo }
        5 { show-FileHash }
        6 { Write-Host "Exiting..."; return <#exit#> } #instead of break use exit if not used within ISE
        default { Write-Host "Invalid choice." -ForegroundColor Red }

    }

    Read-Host "Press Enter to continue..."
} while ($true)