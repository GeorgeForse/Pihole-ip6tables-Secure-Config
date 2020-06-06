#!/bin/bash

# Loosely based upon "ip6tables_setup.bash" by Velizarn - https://velizarn.github.io/

# Set default chain policies
ip6tables -P INPUT ACCEPT
ip6tables -P FORWARD ACCEPT
ip6tables -P OUTPUT ACCEPT

# Accept related & established traffic from existing rules:
ip6tables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# Accept all ICMP packets. Unlike with IPv4, it's not a good idea to block ICMPv6 traffic as IPv6 is much more heavily dependent on it:
ip6tables -A INPUT -p ipv6-icmp -j ACCEPT

# Accept all traffic from/to the local interface:
ip6tables -A INPUT -i lo -j ACCEPT

# Accept DHCPv6 traffic. If you use stateless autoconfiguration, or statically configure your machines, this is not necessary:
ip6tables -A INPUT -d fe80::/64 -p udp -m udp --dport 546 -m state --state NEW -j ACCEPT

# Insert UDP/TCP Port 53 Rule for fe80::/64 (Link-Local IPv6 Traffic).
# This will allow your Pihole instance to respond to Link-Local IPv6 clients.
# Use "ip addr" to find your server's Link Local Address and configure it in DNSv6 on your clients, and/or DHCPv6.
ip6tables -I INPUT -d fe80::/64 -p udp --dport 53 -j ACCEPT
ip6tables -I INPUT -d fe80::/64 -p tcp --dport 53 -j ACCEPT

# At the end of our rules, we reject all traffic that didn't match a rule, using "port unreachable".
# This results in the standard "Connection refused" message at the other end, and effectively hides the fact that we have a firewall.
# Tools such as nmap will report that all our ports are "closed" rather than "filtered"
# and have a much more difficult time determining that we even have a firewall.
ip6tables -A INPUT -j REJECT --reject-with icmp6-adm-prohibited
ip6tables -A FORWARD -j REJECT --reject-with icmp6-adm-prohibited

# List the new rules
ip6tables -S
