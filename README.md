# Firewall Script 🔥

A simple Bash script that configures basic iptables rules to secure a Linux machine. It resets existing rules and applies a default deny-all policy while allowing loopback traffic and SSH access.

## 🚀 Features
- Flushes all existing iptables rules
- Sets default policies to DROP incoming and forwarding traffic
- Allows established and related connections
- Allows traffic on loopback interface
- Enables SSH access (port 22)

## 📦 Requirements
- Linux system with `iptables` installed
- Root privileges

## 🛠️ How to Use
```bash
git clone https://github.com/yourusername/firewall-script.git
cd firewall-script
chmod +x firewall.sh
sudo ./firewall.sh
