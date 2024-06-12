#!/bin/bash

SOURCE="/home/sharun/Documents/DevOps"
DESTINATION="/home/sharun/Documents/backup"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

# Create backup directory 
mkdir -p $DESTINATION


# Create a compressed backup file
tar -czf $DESTINATION/backup_$DATE.tar.gz -C $SOURCE .

echo "Backup completed on $DATE"

