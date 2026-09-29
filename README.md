\# Windows Wi-Fi Diagnostic \& Support Tool



A PowerShell-based troubleshooting tool designed for basic L1 IT Support and Windows network diagnostics.



\## Project Overview



The Windows Wi-Fi Diagnostic \& Support Tool automates common first-level network troubleshooting checks on a Windows system.



Instead of manually running multiple network commands, the tool performs several diagnostic checks and generates a timestamped text report containing the results.



\## Key Features



\* Checks Wi-Fi adapter status

\* Collects IPv4 network configuration

\* Detects subnet prefix and default gateway

\* Identifies configured DNS servers

\* Tests gateway connectivity

\* Tests public internet connectivity

\* Tests DNS resolution

\* Checks Wi-Fi signal strength

\* Displays PASS/FAIL results

\* Generates an automatic timestamped diagnostic report



\## Technologies Used



\* PowerShell

\* Windows Networking

\* DNS Diagnostics

\* Get-NetAdapter

\* Get-NetIPConfiguration

\* Test-Connection

\* Resolve-DnsName

\* netsh wlan



\## Diagnostic Workflow



```text

Wi-Fi Adapter

&#x20;     ↓

Network Configuration

&#x20;     ↓

Gateway Connectivity

&#x20;     ↓

Public Internet

&#x20;     ↓

DNS Resolution

&#x20;     ↓

Wi-Fi Signal

&#x20;     ↓

Overall Result

&#x20;     ↓

Diagnostic Report

```



\## How to Run



\### 1. Open PowerShell



Navigate to the project directory.



```powershell

cd "Wifi Diagnostic \& Support tool"

```



\### 2. Allow the Script for the Current PowerShell Session



```powershell

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

```



This temporary setting applies only to the current PowerShell session.



\### 3. Run the Tool



```powershell

.\\Wifi-Diagnostic.ps1

```



\### 4. View the Generated Report



The tool automatically creates a timestamped report inside the `Reports` folder.



Example:



```text

Reports/

└── WiFi-Diagnostic-YYYYMMDD-HHMMSS.txt

```



\## Sample Diagnostic Result



```text

\[WI-FI ADAPTER]

Adapter: Realtek WiFi Adapter

Status: Up

Result: PASS



\[NETWORK CONFIGURATION]

IPv4 Address: 192.168.1.100

Subnet Prefix Length: 24

Default Gateway: 192.168.1.1

DNS Server: 8.8.8.8



\[GATEWAY CONNECTIVITY]

Gateway Reachable: True

Result: PASS



\[PUBLIC INTERNET]

Public IP Reachable: True

Result: PASS



\[DNS RESOLUTION]

DNS Resolution: Successful

Result: PASS



\[WI-FI SIGNAL]

Signal: 90%



\[OVERALL RESULT]

Status: ALL BASIC CHECKS PASSED

```



\## L1 IT Support Use Case



This tool can assist an L1 Support Engineer during the initial troubleshooting of common Wi-Fi connectivity issues.



The diagnostic checks help identify whether a problem may be related to:



\* Wi-Fi adapter availability

\* Local network configuration

\* Gateway connectivity

\* Internet connectivity

\* DNS resolution

\* Wi-Fi signal strength



The generated report can also provide useful information when documenting or escalating a network issue to a higher-level support team.



\## Project Structure



```text

Wifi-Diagnostic-Support-Tool/

│

├── Wifi-Diagnostic.ps1

├── README.md

│

├── Docs/

│

├── Reports/

│   └── Sample-WiFi-Diagnostic-Report.txt

│

└── Screenshots/

```



\## Skills Demonstrated



\* PowerShell scripting

\* Windows troubleshooting

\* Basic networking

\* IP configuration

\* DNS troubleshooting

\* Connectivity testing

\* Diagnostic reporting

\* L1 IT Support concepts

\* Technical documentation



\## Future Improvements



\* Add Wi-Fi profile information

\* Add latency measurement

\* Add automatic troubleshooting suggestions

\* Add CSV report generation

\* Add Windows event-log checks

\* Add a simple graphical interface



\## Author



\*\*Tishone Prabhu\*\*



BCA Graduate | IT Operations Professional



