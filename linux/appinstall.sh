#!/bin/bash

# Function to install PHP on Ubuntu
install_php_ubuntu() {
    read -p "Enter PHP version to install (e.g., 8.1): " php_version
    sudo apt update
    sudo apt install -y software-properties-common
    sudo add-apt-repository ppa:ondrej/php -y
    sudo apt update
    sudo apt install -y php$php_version php$php_version-cli php$php_version-fpm php$php_version-mysql
    php -v
}

# Function to install PHP on AlmaLinux
install_php_almalinux() {
    read -p "Enter PHP version to install (e.g., 8.1): " php_version
    sudo dnf install -y epel-release
    sudo dnf install -y https://rpms.remirepo.net/enterprise/remi-release-9.rpm
    sudo dnf module reset php -y
    sudo dnf module enable php:remi-${php_version} -y
    sudo dnf install -y php php-cli php-fpm php-mysqlnd
    php -v
}

# Function to install MySQL on Ubuntu
install_mysql_ubuntu() {
    read -p "Enter MySQL version to install (e.g., 8.0): " mysql_version
    wget https://dev.mysql.com/get/mysql-apt-config_${mysql_version}-1_all.deb
    sudo dpkg -i mysql-apt-config_${mysql_version}-1_all.deb
    sudo apt update
    sudo apt install -y mysql-server
    mysql --version
}

# Function to install MySQL on AlmaLinux
install_mysql_almalinux() {
    read -p "Enter MySQL version to install (e.g., 8.0): " mysql_version
    wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
    sudo rpm -Uvh mysql80-community-release-el9-1.noarch.rpm
    sudo dnf install -y mysql-server
    sudo systemctl start mysqld
    sudo systemctl enable mysqld
    mysql --version
}

# Function to install phpMyAdmin on Ubuntu
install_phpmyadmin_ubuntu() {
    read -p "Enter phpMyAdmin version to install (e.g., 5.1.1): " phpmyadmin_version
    wget https://files.phpmyadmin.net/phpMyAdmin/${phpmyadmin_version}/phpMyAdmin-${phpmyadmin_version}-all-languages.zip
    unzip phpMyAdmin-${phpmyadmin_version}-all-languages.zip
    sudo mv phpMyAdmin-${phpmyadmin_version}-all-languages /usr/share/phpmyadmin
    sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
    sudo apt install -y php-mbstring php-zip php-gd php-json php-curl
    sudo systemctl restart apache2
}

# Function to install phpMyAdmin on AlmaLinux
install_phpmyadmin_almalinux() {
    read -p "Enter phpMyAdmin version to install (e.g., 5.1.1): " phpmyadmin_version
    wget https://files.phpmyadmin.net/phpMyAdmin/${phpmyadmin_version}/phpMyAdmin-${phpmyadmin_version}-all-languages.zip
    unzip phpMyAdmin-${phpmyadmin_version}-all-languages.zip
    sudo mv phpMyAdmin-${phpmyadmin_version}-all-languages /usr/share/phpmyadmin
    sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
    sudo dnf install -y php-mbstring php-zip php-gd php-json php-curl
    sudo systemctl restart httpd
}

echo "Select the operating system:"
echo "1) Ubuntu"
echo "2) AlmaLinux 9"

read -p "Enter your choice (1-2): " os_choice

echo "Select the software to install:"
echo "1) PHP"
echo "2) MySQL"
echo "3) phpMyAdmin"
echo "4) All of the above"

read -p "Enter your choice (1-4): " choice

case $os_choice in
    1)
        case $choice in
            1)
                install_php_ubuntu
                ;;
            2)
                install_mysql_ubuntu
                ;;
            3)
                install_phpmyadmin_ubuntu
                ;;
            4)
                install

