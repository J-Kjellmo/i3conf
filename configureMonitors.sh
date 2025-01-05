#!/bin/bash

# Get the connected monitors
connected_monitors=$(xrandr --query | grep " connected" | awk '{print $1}')

# Check if there are any connected monitors
if [[ -z "$connected_monitors" ]]; then
    echo "No connected monitors found."
    exit 1
fi

# Prompt the user to select the primary monitor
echo "Connected monitors:"
echo "$connected_monitors"
read -p "Enter the name of the primary monitor: " primary_monitor

# Validate the primary monitor
if ! echo "$connected_monitors" | grep -q "^$primary_monitor$"; then
    echo "Invalid monitor name: $primary_monitor"
    exit 1
fi

# Set the primary monitor to its highest resolution and refresh rate
primary_mode=$(xrandr --query | grep -A1 "^$primary_monitor connected" | tail -n1 | awk '{print $1}')
xrandr --output "$primary_monitor" --primary --mode "$primary_mode"
echo "Primary monitor set to $primary_monitor with mode $primary_mode."

# Configure the other monitors
for monitor in $connected_monitors; do
    if [[ "$monitor" == "$primary_monitor" ]]; then
        continue
    fi

    # Set the highest resolution and refresh rate for the monitor
    highest_mode=$(xrandr --query | grep -A1 "^$monitor connected" | tail -n1 | awk '{print $1}')
    xrandr --output "$monitor" --mode "$highest_mode"
    echo "Set $monitor to mode $highest_mode."

    # Ask the user where to position the monitor
    echo "Where should $monitor be positioned relative to $primary_monitor?"
    echo "Options: --left-of, --right-of, --above, --below"
    read -p "Enter your choice: " position

    # Validate the position
    if [[ "$position" =~ ^(--left-of|--right-of|--above|--below)$ ]]; then
        xrandr --output "$monitor" "$position" "$primary_monitor"
        echo "$monitor positioned $position $primary_monitor."
    else
        echo "Invalid position: $position. Skipping positioning for $monitor."
    fi
done

echo "Monitor configuration complete."

