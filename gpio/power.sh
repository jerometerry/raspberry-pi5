#!/bin/bash
# L6 Engine Throttle Controller
# Usage: ./throttle.sh [1-100]

POWER=$1

# 1. Input Validation
if [[ -z "$POWER" ]] || ! [[ "$POWER" =~ ^[0-9]+$ ]] || [ "$POWER" -lt 1 ] || [ "$POWER" -gt 100 ]; then
    echo "Error: Invalid input. Throttle requires an integer between 1 and 100."
    echo "Usage: ./throttle.sh 65"
    exit 1
fi

# 2. Hardware State Check (Observability)
PWM_DIR="/sys/class/pwm/pwmchip0/pwm2"
ENABLE_FILE="${PWM_DIR}/enable"

# Check if the kernel has even exported the channel yet
if [ ! -f "$ENABLE_FILE" ]; then
    echo "FATAL: PWM infrastructure is not exported. Run start_engine.sh first."
    exit 1
fi

# Read the physical gate state from the silicon
IS_RUNNING=$(cat "$ENABLE_FILE")

if [ "$IS_RUNNING" -ne 1 ]; then
    echo "ERROR: The L6 Engine is currently SECURED (Enable = 0). Cannot apply throttle while gates are closed."
    exit 1
fi

# 3. Silicon Math & Execution
DUTY_NS=$(( POWER * 100000 ))

echo "Engine is LIVE. Shifting throttle to ${POWER}%..."
echo $DUTY_NS | sudo tee ${PWM_DIR}/duty_cycle > /dev/null

echo "Throttle applied."