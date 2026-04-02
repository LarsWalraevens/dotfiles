#!/bin/bash

if bluetoothctl show | grep -q "Powered: yes"; then
    bluetoothctl power off
    echo "󰂲"
else
    bluetoothctl power on
    echo "󰂯"
fi
