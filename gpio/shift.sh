#!/bin/bash
# L6 Engine Transmission Controller
# Usage: ./shift.sh [forward|reverse]

DIRECTION=$1

# 1. Input Validation
if [ "$DIRECTION" != "forward" ] && [ "$DIRECTION" != "reverse" ]; then
    echo "Error: Invalid input. Transmission requires 'forward' or 'reverse'."
    echo "Usage: ./shift.sh reverse"
    exit 1
fi

# 2. State Mutation (Silicon Logic)
echo "Shifting transmission to ${DIRECTION^^}..."

if [ "$DIRECTION" == "forward" ]; then
    pinctrl set 17 op dh  # IN1 High
    pinctrl set 27 op dl  # IN2 Low
elif [ "$DIRECTION" == "reverse" ]; then
    pinctrl set 17 op dl  # IN1 Low
    pinctrl set 27 op dh  # IN2 High
fi

echo "Transmission shifted."