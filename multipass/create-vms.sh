#!/bin/bash
multipass launch --name k3s-master --cpus 1 --mem 1024M --disk 3G
multipass launch --name k3s-worker1 --cpus 1 --mem 1024M --disk 3G
multipass launch --name k3s-worker2 --cpus 1 --mem 1024M --disk 3G
