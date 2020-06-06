# Pihole ip6tables IPV6 Secure Config
Stealth your Pihole instance over IPv6, only responding to ICMPv6 over the internet, and Port 53 (TCP/UDP) & DHCPv6 for fe80::/64

# Prerequisites
You will need wget and ip6tables installed. It is also recommended that you check "pihole-ip6tables-secure-config.bash" manually to ensure that the git repository has not been compromised, not that I would expect it to be.

# Usage & Installation
In bash, run the following command:
> wget -O - https://raw.githubusercontent.com/MrGForse/Pihole-ip6tables-Secure-Config/master/pihole-ip6tables-secure-config.bash | sudo bash

# Caution:
This configuration is still in testing. Install at your own risk.
