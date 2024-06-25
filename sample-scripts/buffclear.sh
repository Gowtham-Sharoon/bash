#!/bin/bash

echo "Before cache clear"
free -h

#To clear the buff/cache on Linux
sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'

echo "After cache clear"
free -h


#Execute this script as root user or use sudo sh in prefix to filename
