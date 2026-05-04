#!/bin/bash
# L6 Engine Graceful Shutdown & Brake

echo "Closing H-Bridge Gates..."
echo 0 | sudo tee /sys/class/pwm/pwmchip0/pwm2/enable > /dev/null

echo "Applying Hardware Brake..."
pinctrl set 17 op dl  # Drive IN1 Low
pinctrl set 27 op dl  # Drive IN2 Low

echo "L6 Engine is SECURED."