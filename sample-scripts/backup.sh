#!/bin/bash


#On source need to mention the path of folder name, which need to be archived
SOURCE="/home/sharun/Documents/DevOps"

#under destination, Need to mention the storage path of the archived file
DESTINATION="/home/sharun/Documents/backup"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

# Create backup directory 
mkdir -p $DESTINATION


# Create a compressed backup file
tar -czf $DESTINATION/backup_$DATE.tar.gz -C $SOURCE .

echo "Backup completed on $DATE"

