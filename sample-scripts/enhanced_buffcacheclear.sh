#!/bin/bash

# Checking the scrip run as root,
if [ "$(id -u)" -ne 0 ]; then
   echo "This script must be run as root or with sudo."
   exit 1
fi

echo "Before clearing cache:"
free -h

# To clear the cache
echo "Clearing cache..."
sync; echo 3 > /proc/sys/vm/drop_caches

# Verifing the cache clear on server
if [ $? -eq 0 ]; then
    echo "Cache cleared successfully."
else
    echo "Failed to clear cache."
    exit 1
fi

echo "After clearing cache:"
free -h

echo "Cache clear operation completed."

# Note:
# - This script should be executed with root privileges: sudo ./script_name.sh or sudo sh script_name.sh

