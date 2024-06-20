#!/bin/bash

echo "Before clear"
free -h

#To clear the buff/cache on Linux
sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'

echo "After cache clear"
free -h
