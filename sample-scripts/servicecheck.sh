#!/bin/bash

# Sample service check & restart automatically

#SERVICE1="nginx"

echo "Enter the service name to check the status & run"
echo "Eg: nginx, Mysql, apache2, httpd, ufw, network, ssh, Docker, Etc"
read SERVICE


# Check if the service is running, if not, start it

if systemctl is-active --quiet $SERVICE; then
	echo "$SERVICE is running"
else
	echo "$SERVICE is not running"
 	systemctl start $SERVICE
fi


