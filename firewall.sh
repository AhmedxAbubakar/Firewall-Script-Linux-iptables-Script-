#!/bin/bash

# Advanced Firewall Script

# Flush existing rules
iptables -F
iptables -X
iptables -Z

# Set default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback
iptables -A INPUT -i lo -j ACCEPT

# Allow established and related connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow limited ICMP (ping)
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s --limit-burst 5 -j ACCEPT

# Anti-spoofing (drop private/reserved IPs on external interfaces)
iptables -A INPUT -s 10.0.0.0/8 -j DROP
iptables -A INPUT -s 172.16.0.0/12 -j DROP
iptables -A INPUT -s 192.168.0.0/16 -j DROP
iptables -A INPUT -s 127.0.0.0/8 ! -i lo -j DROP

# Allow SSH (rate-limited)
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 60 --hitcount 5 -j DROP
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow HTTP/HTTPS only from internal network (example 192.168.1.0/24)
iptables -A INPUT -p tcp -s 192.168.1.0/24 --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.1.0/24 --dport 443 -j ACCEPT

# Log and drop everything else
iptables -A INPUT -m limit --limit 10/min -j LOG --log-prefix "IPTABLES DROPPED: " --log-level 4
iptables -A INPUT -j DROP

echo "✅ Advanced firewall rules applied."
