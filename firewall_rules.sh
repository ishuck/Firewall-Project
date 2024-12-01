#!/bin/bash

# Function to add a firewall rule
add_rule() {
    local source=$1
    local destination=$2
    local port=$3
    local protocol=$4
    local action=$5

    # Convert action to iptables-compatible format
    if [[ "$action" == "ALLOW" ]]; then
        action="ACCEPT"
    elif [[ "$action" == "DENY" ]]; then
        action="DROP"
    fi

    # Add the iptables rule
    iptables -A FORWARD -s "$source" -d "$destination" -p "$protocol" --dport "$port" -j "$action"
}

# Example Usage

# Allow HR to Accounting RDP Access
add_rule "192.168.1.0/24" "192.168.2.0/24" 3389 "tcp" "ALLOW"

# Block Social Media for Accounting (via Facebook example)
add_rule "192.168.2.0/24" "facebook.com" 443 "tcp" "DENY"

# Save the rules to persist across reboots
iptables-save > /etc/iptables/rules.v4

echo "Firewall rules added successfully."
