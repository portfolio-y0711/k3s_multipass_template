export MASTER_IP=192.168.64.3 
k3sup install --ip $MASTER_IP  --user ubuntu --k3s-channel v1.24 --local-path /tmp/config

export AGENT_IP=192.168.64.4 
#export AGENT_IP=192.168.64.5 
k3sup join --ip $AGENT_IP --user ubuntu --server-ip $MASTER_IP --k3s-channel v1.24\n
