#!/bin/bash
#export HOSTS="192.168.1.11 192.168.1.12"


# Read the list of IP addresses from the environment variable
IP_ADDRESSES=($HOSTS)
# Check if there is at least one IP address
if [ ${#IP_ADDRESSES[@]} -eq 0 ]; then
    echo "No IP addresses found. Please ensure the HOSTS environment variable is correctly set."
    exit 1
fi
# Clean up the master node
MASTER_IP=${IP_ADDRESSES[0]}
echo "Cleaning up master node: $MASTER_IP"
ssh -i ~/.ssh/id_rsa $MASTER_IP k3s-uninstall.sh
# Clean up the other agent nodes
for i in "${!IP_ADDRESSES[@]}"; do
    if [ $i -ne 0 ]; then
        AGENT_IP=${IP_ADDRESSES[$i]}
        echo "Cleaning up agent node: $AGENT_IP"
        ssh -i ~/.ssh/id_rsa $AGENT_IP k3s-agent-uninstall.sh
    fi
done
echo "k3s cluster cleanup complete."

