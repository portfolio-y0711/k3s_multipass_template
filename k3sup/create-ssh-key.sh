#!/bin/bash
ssh-keygen -C vmuser -f multipass-ssh-key
multipass launch -n testvm --cloud-init cloud-init.yaml
