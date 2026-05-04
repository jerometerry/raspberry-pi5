#!/bin/bash
# L6 Engine Hardware API - Dynamic Speed & Direction
# Usage: ./start_engine.sh [forward|reverse] [1-100]

DIRECTION=${1:-forward}
POWER=${2:-40}

# 1. Parameter Validation
if ! [[ "$POWER" =~ ^[0-9]+$ ]] || [ "$POWER" -lt 1 ] || [ "$POWER" -gt 100 ]; then
    echo "Error: Power level must be an integer between 1 and 100."
    exit 1
fi

# 2. Silicon Math (1% = 100,000 ns)
DUTY_NS=$(( POWER * 100000 ))

echo "Configuring Transmission..."
if [ "$DIRECTION" == "forward" ]; then
    echo "  -> Shifting to FORWARD at ${POWER}% Power"
    pinctrl set 17 op dh  # IN1 High
    pinctrl set 27 op dl  # IN2 Low
elif [ "$DIRECTION" == "reverse" ]; then
    echo "  -> Shifting to REVERSE at ${POWER}% Power"
    pinctrl set 17 op dl  # IN1 Low
    pinctrl set 27 op dh  # IN2 High
else
    echo "Error: Invalid direction. Use 'forward' or 'reverse'."
    exit 1
fi

echo "Exporting Hardware Channel..."
echo 2 | sudo tee /sys/class/pwm/pwmchip0/export > /dev/null 2>&1
sleep 0.2

echo "Setting 100Hz Frequency..."
echo 10000000 | sudo tee /sys/class/pwm/pwmchip0/pwm2/period > /dev/null

echo "Applying ${POWER}% Duty Cycle (${DUTY_NS} ns)..."
echo $DUTY_NS | sudo tee /sys/class/pwm/pwmchip0/pwm2/duty_cycle > /dev/null

echo "Opening H-Bridge Gates..."
echo 1 | sudo tee /sys/class/pwm/pwmchip0/pwm2/enable > /dev/null

echo "L6 Engine is LIVE."