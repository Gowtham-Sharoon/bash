#!/bin/bash

#install net tools before running the below cmd
#sudo apt install net-tools

# List all listening ports and the associated services
netstat -tuln | grep LISTEN
