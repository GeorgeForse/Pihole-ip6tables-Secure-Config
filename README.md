# A secure ip6tables config for Pihole

Pihole, when installed on a common distro such as Raspbian Jessie, will by default have SSH, HTTP and DNS available to all external IPv6 Addresses. This is more the fault of the OS and not Pihole itself.

This ip6tables config will reject mostly everything by default for **ALL** IPv6 addresses, leaving only ICMPv6 open for all IPv6 addresses, and DHCPv6/DNSv6 open for Link-Local (fe80::/64) addresses. You may wish to either fork this project, or modify the bash script to open additional ports.

# Prerequisites
- wget
- ip6tables 

It is also recommended that you check "pihole-ip6tables-secure-config.bash" manually to ensure that the git repository has not been compromised, not that I would expect it to be.

# Usage & Installation
In bash, run the following command:

```bash
 wget -O - https://raw.githubusercontent.com/MrGForse/Pihole-ip6tables-Secure-Config/master/pihole-ip6tables-secure-config.bash | sudo bash 
```

# Caution:
This configuration is still in testing. Install at your own risk.

**As stated above, this script will block everything apart from ICMPv6 for all addresses, and only allow DHCPv6 and DNSv6 for Link-Local (fe80::/64) addresses. Make sure you have alternate remote control methods, such as SSH on IPV4, before running this script if you do not have physical access to the device you're running the script on.**
