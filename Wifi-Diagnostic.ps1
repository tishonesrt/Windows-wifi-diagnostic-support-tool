# ============================================================
# Windows Wi-Fi Diagnostic & Support Tool
# Author  : Tishone Prabhu
# Purpose : Basic L1 IT Support Network Diagnostics
# ============================================================

Clear-Host

Write-Host "================================================"
Write-Host "     Windows Wi-Fi Diagnostic & Support Tool"
Write-Host "================================================"
Write-Host ""

# ------------------------------------------------------------
# Report Setup
# ------------------------------------------------------------

$ReportFolder = ".\Reports"

if (!(Test-Path $ReportFolder)) {
    New-Item -ItemType Directory -Path $ReportFolder | Out-Null
}

$TimeStamp = Get-Date -Format "yyyyMMdd-HHmmss"
$ReportFile = "$ReportFolder\WiFi-Diagnostic-$TimeStamp.txt"

$Report = @()

$Report += "================================================"
$Report += "       Windows Wi-Fi Diagnostic Report"
$Report += "================================================"
$Report += "Date: $(Get-Date -Format 'dd-MM-yyyy HH:mm:ss')"
$Report += ""

# ------------------------------------------------------------
# 1. Wi-Fi Adapter Check
# ------------------------------------------------------------

Write-Host "Checking Wi-Fi Adapter..."

$WiFiAdapter = Get-NetAdapter -Name "Wi-Fi" -ErrorAction SilentlyContinue

if ($WiFiAdapter) {

    $AdapterStatus = $WiFiAdapter.Status
    $AdapterName = $WiFiAdapter.InterfaceDescription

    if ($AdapterStatus -eq "Up") {
        Write-Host "Wi-Fi adapter is active" -ForegroundColor Green
        $AdapterResult = "PASS"
    }
    else {
        Write-Host "Wi-Fi adapter is not active" -ForegroundColor Red
        $AdapterResult = "FAIL"
    }

}
else {

    Write-Host "Wi-Fi adapter not found" -ForegroundColor Red
    $AdapterStatus = "Not Found"
    $AdapterName = "Not Found"
    $AdapterResult = "FAIL"

}

$Report += "[WI-FI ADAPTER]"
$Report += "Adapter: $AdapterName"
$Report += "Status: $AdapterStatus"
$Report += "Result: $AdapterResult"
$Report += ""

# ------------------------------------------------------------
# 2. Network Configuration
# ------------------------------------------------------------

Write-Host "Collecting IP Configuration..."

$IPConfig = Get-NetIPConfiguration -InterfaceAlias "Wi-Fi" -ErrorAction SilentlyContinue

if ($IPConfig) {

    $IPv4Address = $IPConfig.IPv4Address.IPAddress
    $SubnetPrefix = $IPConfig.IPv4Address.PrefixLength
    $Gateway = $IPConfig.IPv4DefaultGateway.NextHop
    $DNSServer = ($IPConfig.DNSServer.ServerAddresses -join ", ")

}
else {

    $IPv4Address = "Not Available"
    $SubnetPrefix = "Not Available"
    $Gateway = "Not Available"
    $DNSServer = "Not Available"

}

$Report += "[NETWORK CONFIGURATION]"
$Report += "IPv4 Address: $IPv4Address"
$Report += "Subnet Prefix Length: $SubnetPrefix"
$Report += "Default Gateway: $Gateway"
$Report += "DNS Server: $DNSServer"
$Report += ""

# ------------------------------------------------------------
# 3. Gateway Connectivity
# ------------------------------------------------------------

Write-Host "Checking Gateway Connectivity..."

$GatewayTest = $false

if ($Gateway -and $Gateway -ne "Not Available") {

    $GatewayTest = Test-Connection -ComputerName $Gateway -Count 2 -Quiet

    if ($GatewayTest) {
        Write-Host "Gateway is reachable" -ForegroundColor Green
        $GatewayResult = "PASS"
    }
    else {
        Write-Host "Gateway is not reachable" -ForegroundColor Red
        $GatewayResult = "FAIL"
    }

}
else {

    Write-Host "Gateway not available" -ForegroundColor Red
    $GatewayResult = "FAIL"

}

$Report += "[GATEWAY CONNECTIVITY]"
$Report += "Gateway: $Gateway"
$Report += "Gateway Reachable: $GatewayTest"
$Report += "Result: $GatewayResult"
$Report += ""

# ------------------------------------------------------------
# 4. Public Internet Connectivity
# ------------------------------------------------------------

Write-Host "Checking Public Internet Connectivity..."

$PublicIPTest = Test-Connection -ComputerName "1.1.1.1" -Count 2 -Quiet

if ($PublicIPTest) {

    Write-Host "Public Internet is reachable" -ForegroundColor Green
    $InternetResult = "PASS"

}
else {

    Write-Host "Public Internet is not reachable" -ForegroundColor Red
    $InternetResult = "FAIL"

}

$Report += "[PUBLIC INTERNET]"
$Report += "Test Address: 1.1.1.1"
$Report += "Public IP Reachable: $PublicIPTest"
$Report += "Result: $InternetResult"
$Report += ""

# ------------------------------------------------------------
# 5. DNS Resolution
# ------------------------------------------------------------

Write-Host "Checking DNS Resolution..."

try {

    $DNSResult = Resolve-DnsName "google.com" -ErrorAction Stop

    if ($DNSResult) {
        Write-Host "DNS resolution successful" -ForegroundColor Green
        $DNSStatus = "Successful"
        $DNSCheckResult = "PASS"
    }

}
catch {

    Write-Host "DNS resolution failed" -ForegroundColor Red
    $DNSStatus = "Failed"
    $DNSCheckResult = "FAIL"

}

$Report += "[DNS RESOLUTION]"
$Report += "Test Domain: google.com"
$Report += "DNS Resolution: $DNSStatus"
$Report += "Result: $DNSCheckResult"
$Report += ""

# ------------------------------------------------------------
# 6. Wi-Fi Signal Strength
# ------------------------------------------------------------

Write-Host "Collecting Wi-Fi Signal Information..."

$WiFiSignal = netsh wlan show interfaces 2>$null

$SignalLine = $WiFiSignal | Select-String "Signal"

if ($SignalLine) {

    $Signal = ($SignalLine.ToString() -replace ".*Signal\s*:\s*", "").Trim()

}
else {

    $Signal = "Not Available"

}

$Report += "[WI-FI SIGNAL]"
$Report += "Signal: $Signal"
$Report += ""

# ------------------------------------------------------------
# 7. Overall Diagnostic Result
# ------------------------------------------------------------

Write-Host "Generating Overall Diagnostic Result..."

$Results = @(
    $AdapterResult
    $GatewayResult
    $InternetResult
    $DNSCheckResult
)

if ($Results -contains "FAIL") {

    $OverallResult = "ATTENTION REQUIRED"

}
else {

    $OverallResult = "ALL BASIC CHECKS PASSED"

}

$Report += "[OVERALL RESULT]"
$Report += "Status: $OverallResult"
$Report += ""

# ------------------------------------------------------------
# 8. Complete Report
# ------------------------------------------------------------

$Report += "================================================"
$Report += "Diagnostic completed."
$Report += "================================================"

$Report | Out-File -FilePath $ReportFile -Encoding UTF8

# ------------------------------------------------------------
# Final Console Output
# ------------------------------------------------------------

Write-Host ""
Write-Host "================================================"
Write-Host "Diagnostic completed."
Write-Host "Report saved to: $ReportFile"
Write-Host "================================================"