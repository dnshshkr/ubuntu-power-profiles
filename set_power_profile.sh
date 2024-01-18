#!/bin/bash

# Check the number of arguments
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <power_profile>"
    exit 1
fi

# Parse arguments
power_profile="$1"

# Function to set the power profile
function set_power_profile {
    case "$1" in
        "performance")
            echo "Setting power profile to 'performance'"
            gdbus call --system --dest net.hadess.PowerProfiles --object-path /net/hadess/PowerProfiles --method org.freedesktop.DBus.Properties.Set 'net.hadess.PowerProfiles' 'ActiveProfile' "<'performance'>"
            ;;
        "balanced")
            echo "Setting power profile to 'balanced'"
            gdbus call --system --dest net.hadess.PowerProfiles --object-path /net/hadess/PowerProfiles --method org.freedesktop.DBus.Properties.Set 'net.hadess.PowerProfiles' 'ActiveProfile' "<'balanced'>"
            ;;
        "power-saver")
            echo "Setting power profile to 'power-saver'"
            gdbus call --system --dest net.hadess.PowerProfiles --object-path /net/hadess/PowerProfiles --method org.freedesktop.DBus.Properties.Set 'net.hadess.PowerProfiles' 'ActiveProfile' "<'power-saver'>"
            ;;
        *)
            echo "Invalid power profile: $1"
            exit 1
            ;;
    esac
}

# Run the function to set the power profile
set_power_profile "$power_profile"
