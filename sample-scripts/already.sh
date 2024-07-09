#!/bin/bash

# Check if a filename argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <script_name>"
    exit 1
fi

# Extract the script name from the argument
SCRIPT_NAME="$1"

# Find all processes associated with the script
PIDS=$(pgrep -f "$SCRIPT_NAME")

if [ -z "$PIDS" ]; then
    echo "No processes found for $SCRIPT_NAME"
    exit 0
fi

echo "Processes found for $SCRIPT_NAME:"
echo "$PIDS"

# Ask user for confirmation to kill processes
read -p "Do you want to kill these processes? [y/N] " response

# Check if the user wants to kill processes
case "$response" in
    [yY][eE][sS]|[yY])
        echo "Killing processes..."
        echo "$PIDS" | xargs kill
        echo "Processes killed."
        ;;
    *)
        echo "No processes were killed."
        ;;
esac

