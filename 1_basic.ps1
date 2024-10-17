Write-Host "Simple Powershell Script" 

$greeting = "Hello"
$name = "Airman"

function Say-Hello {
    param($userName)
    Write-Host "$greeting, $userName!"

}

Say-Hello $name