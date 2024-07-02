#!/bin/bash

# Function to generate a random password
generate_password() {
    local length=$1
    # Create a password with a mix of upper and lower case letters, numbers, and special characters
    tr -dc 'A-Za-z0-9!@#$%^&*()_+=-{}[]|:;<>,.?/' < /dev/urandom | head -c "$length" | xargs
}

# Default password length
DEFAULT_LENGTH=16

# Check if a length is provided as an argument, otherwise use the default length
if [ -n "$1" ]; then
    PASSWORD_LENGTH=$1
else
    PASSWORD_LENGTH=$DEFAULT_LENGTH
fi

# Generate and display the password
PASSWORD=$(generate_password "$PASSWORD_LENGTH")
echo "Generated Password: $PASSWORD"

