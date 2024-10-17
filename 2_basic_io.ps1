Write-Host "Simple Powershell Script"

$greeting = "Hello"
#$name = "Airman"

$name = Read-Host "Please enter your name"

function Say-Hello {
    param($userName)
    Write-Host "$greeting, $userName!"
}

Say-Hello $name