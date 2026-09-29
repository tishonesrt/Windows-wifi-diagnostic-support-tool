\# Windows Wi-Fi Diagnostic \& Support Tool



\## 1. Project Title



\*\*Windows Wi-Fi Diagnostic \& Support Tool\*\*



\## 2. Project Description



The Windows Wi-Fi Diagnostic \& Support Tool is a PowerShell-based utility developed to assist with basic Level 1 (L1) IT Support troubleshooting.



The tool performs a sequence of network diagnostic checks on a Windows computer and generates a timestamped text report containing the results.



The purpose of the project is to reduce the need for manually running multiple troubleshooting commands during common Wi-Fi connectivity issues.



\## 3. Problem Statement



When a user reports that their computer cannot access the internet, an L1 Support Engineer needs to identify where the connectivity problem may be occurring.



Common areas that need to be checked include:



\* Wi-Fi adapter status

\* IP configuration

\* Default gateway connectivity

\* Internet connectivity

\* DNS resolution

\* Wi-Fi signal strength



Manually performing these checks can take additional time.



This project combines these basic checks into one PowerShell diagnostic tool.



\## 4. Objectives



The main objectives of this project are:



1\. Automate basic Wi-Fi troubleshooting checks.

2\. Collect useful Windows network information.

3\. Test different levels of network connectivity.

4\. Display clear PASS/FAIL results.

5\. Generate a diagnostic report automatically.

6\. Demonstrate practical PowerShell and L1 Support skills.



\## 5. Technologies and Tools



\### Programming / Scripting



\* PowerShell



\### Windows Networking Commands and Cmdlets



\* `Get-NetAdapter`

\* `Get-NetIPConfiguration`

\* `Test-Connection`

\* `Resolve-DnsName`

\* `netsh wlan`



\### Operating System



\* Windows



\## 6. Diagnostic Workflow



The tool follows a simple troubleshooting sequence:



```text

Start

&#x20; │

&#x20; ▼

Check Wi-Fi Adapter

&#x20; │

&#x20; ▼

Collect Network Configuration

&#x20; │

&#x20; ▼

Test Default Gateway

&#x20; │

&#x20; ▼

Test Public Internet

&#x20; │

&#x20; ▼

Test DNS Resolution

&#x20; │

&#x20; ▼

Check Wi-Fi Signal

&#x20; │

&#x20; ▼

Calculate Overall Result

&#x20; │

&#x20; ▼

Generate Diagnostic Report

&#x20; │

&#x20; ▼

End

```



\## 7. Diagnostic Checks



\### 7.1 Wi-Fi Adapter Check



The tool checks the Windows Wi-Fi adapter using `Get-NetAdapter`.



It identifies:



\* Wi-Fi adapter availability

\* Adapter description

\* Adapter status



If the adapter status is `Up`, the check is marked as `PASS`.



Otherwise, it is marked as `FAIL`.



\### 7.2 Network Configuration



The tool uses `Get-NetIPConfiguration` to collect basic network configuration information.



The report includes:



\* IPv4 address

\* Subnet prefix length

\* Default gateway

\* DNS server



This information helps an L1 Support Engineer understand the computer's current network configuration.



\### 7.3 Gateway Connectivity



The default gateway is tested using `Test-Connection`.



The gateway represents the local network path used by the computer to communicate outside its local network.



If the gateway responds to the connectivity test, the result is marked as `PASS`.



\### 7.4 Public Internet Connectivity



The tool tests connectivity to the public IP address:



```text

1.1.1.1

```



This helps determine whether the computer can reach the public internet using an IP address.



If the test succeeds, the result is marked as `PASS`.



\### 7.5 DNS Resolution



The tool uses `Resolve-DnsName` to test DNS resolution for:



```text

google.com

```



This verifies whether the system can resolve a domain name through DNS.



A successful resolution is marked as `PASS`.



\### 7.6 Wi-Fi Signal Strength



The tool uses:



```text

netsh wlan show interfaces

```



to retrieve the current Wi-Fi signal percentage.



Example:



```text

Signal: 90%

```



This information can help identify whether weak wireless signal may be contributing to connectivity problems.



\## 8. Overall Result



The tool evaluates the results of the main diagnostic checks.



If all required checks pass:



```text

ALL BASIC CHECKS PASSED

```



If one or more checks fail:



```text

ATTENTION REQUIRED

```



This gives the support engineer a quick indication that further troubleshooting may be required.



\## 9. Report Generation



After completing the diagnostics, the tool automatically creates a timestamped report inside the `Reports` folder.



Example:



```text

WiFi-Diagnostic-20260929-141954.txt

```



The report contains:



\* Date and time

\* Wi-Fi adapter information

\* Network configuration

\* Gateway connectivity result

\* Internet connectivity result

\* DNS resolution result

\* Wi-Fi signal strength

\* Overall diagnostic status



\## 10. Example Output



```text

================================================

&#x20;      Windows Wi-Fi Diagnostic Report

================================================



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

Gateway: 192.168.1.1

Gateway Reachable: True

Result: PASS



\[PUBLIC INTERNET]

Test Address: 1.1.1.1

Public IP Reachable: True

Result: PASS



\[DNS RESOLUTION]

Test Domain: google.com

DNS Resolution: Successful

Result: PASS



\[WI-FI SIGNAL]

Signal: 90%



\[OVERALL RESULT]

Status: ALL BASIC CHECKS PASSED



================================================

Diagnostic completed.

================================================

```



\## 11. How to Run the Tool



Open PowerShell and navigate to the project directory.



```powershell

cd "Wifi Diagnostic \& Support tool"

```



If PowerShell execution policy prevents the script from running, allow script execution only for the current PowerShell session:



```powershell

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

```



Run the diagnostic tool:



```powershell

.\\Wifi-Diagnostic.ps1

```



The generated report will be saved automatically inside:



```text

Reports

```



\## 12. L1 Support Troubleshooting Value



The project demonstrates a basic troubleshooting approach commonly used in first-level IT support.



For example:



```text

Wi-Fi Adapter FAIL

&#x20;       ↓

Check adapter / driver / device status



Gateway FAIL

&#x20;       ↓

Investigate local network connection



Internet FAIL

&#x20;       ↓

Investigate upstream connectivity



DNS FAIL

&#x20;       ↓

Investigate DNS configuration/resolution



Signal LOW

&#x20;       ↓

Investigate wireless signal or location

```



The tool does not automatically resolve every problem. Instead, it helps collect initial diagnostic information that can support troubleshooting and escalation.



\## 13. Security and Privacy Considerations



Diagnostic reports can contain network information such as:



\* IP addresses

\* Gateway addresses

\* DNS server information

\* Adapter information



Actual diagnostic reports should therefore be reviewed before being shared publicly.



The GitHub repository should use sanitized sample network information rather than personal or organization-specific network details.



\## 14. Project Limitations



The current version focuses on basic Wi-Fi and network diagnostics.



It does not currently:



\* Automatically repair network problems

\* Modify network configuration

\* Reset network adapters

\* Change DNS settings

\* Diagnose every possible Windows networking issue

\* Provide a graphical user interface



\## 15. Future Improvements



Possible future improvements include:



\* Automatic troubleshooting recommendations

\* Network latency measurement

\* Wi-Fi profile information

\* Windows Event Log analysis

\* CSV report generation

\* Additional connectivity tests

\* Simple graphical user interface

\* More detailed error handling



\## 16. Skills Demonstrated



This project demonstrates practical experience with:



\* PowerShell scripting

\* Windows administration basics

\* Basic networking

\* IP configuration

\* DNS troubleshooting

\* Connectivity testing

\* Command-line troubleshooting

\* Diagnostic reporting

\* Technical documentation

\* L1 IT Support concepts



\## 17. Project Structure



```text

Wifi-Diagnostic-Support-Tool/

│

├── Wifi-Diagnostic.ps1

├── README.md

│

├── Docs/

│   └── Project-Documentation.md

│

├── Reports/

│   └── Sample-WiFi-Diagnostic-Report.txt

│

└── Screenshots/

```



\## 18. Conclusion



The Windows Wi-Fi Diagnostic \& Support Tool provides a simple way to automate common first-level Windows Wi-Fi troubleshooting checks.



The project combines PowerShell scripting, basic networking concepts, diagnostic testing, and automated reporting into a practical L1 IT Support utility.



The project was developed as a hands-on demonstration of Windows troubleshooting and PowerShell skills.



