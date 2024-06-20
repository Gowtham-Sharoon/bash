#!/bin/bash

#install net tools by using the below cmd, before executing this sript
#sudo apt install net-tools

# List all listening ports and the associated services
netstat -tuln | grep LISTEN
