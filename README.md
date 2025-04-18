# 🔥 Advanced iptables Firewall Script

This is a Bash script that configures a secure and robust firewall using `iptables`.  
It includes protections against spoofed traffic, brute-force SSH attacks, and allows only necessary inbound traffic.

---

## 🛡️ Features

- 🔒 Default **deny-all** policy (except outbound)
- 🔁 Allows loopback and established connections
- ⚡ Rate-limits SSH (port 22) to prevent brute-force
- 🌐 Restricts web traffic (port 80/443) to a specific IP range
- 📡 Allows ICMP (ping) with limits
- 🚫 Drops spoofed private/reserved IP ranges on non-loopback interfaces
- 📝 Logs and drops all other incoming traffic

---

## 📦 Requirements

- Linux system with `iptables` installed
- Root privileges to execute the script

---

## 🧰 How to Use

1. **Clone or copy the script:**

```bash
wget https://example.com/firewall.sh
chmod +x firewall.sh
