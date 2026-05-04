# Run this on Mac to discover the serial port name for the USB-to-UART adapter
ls /dev/tty.*

# Connect to the serial console using screen
screen /dev/tty.PL2303G-USBtoUART1220 115200

# Connect to the serial console using minicom
minicom -D /dev/cu.PL2303G-USBtoUART1220 -b 115200

# Mount Mac Share (Replace [uname], [domain], [mac-ip], and [share-name] with actual values)
sudo mount -t cifs -o username=[uname],domain=[domain],uid=1000,gid=1000,rw //[mac-ip]/[share-name] /mnt/mac

# Mac command to find the Raspberry PI SD Card
diskutil list

# Mac command to unmount the SD card before imaging
sudo diskutil unmountDisk /dev/disk4

# Mac command to create an image of the SD card (Replace [uname], [path], and [filename] with actual values)
sudo dd if=/dev/rdisk4 of=/Users/[uname]/[path]/[filename].img bs=1m

# Raspberry PI command to display CPU temperature
watch -n 1 vcgencmd measure_temp

# Raspberry PI command to display fan speed
watch -n 1 cat /sys/devices/platform/cooling_fan/hwmon/hwmon2/fan1_input

# Raspberry PI command to Display GIPO Ports / Status
#
# 0: ip    pu | hi // ID_SDA/GPIO0 = input
# 1: ip    pu | hi // ID_SCL/GPIO1 = input
# 2: no    pu | -- // GPIO2 = none
# 3: no    pu | -- // GPIO3 = none
# 4: no    pu | -- // GPIO4 = none
# 5: no    pu | -- // GPIO5 = none
# 6: no    pu | -- // GPIO6 = none
# 7: no    pu | -- // GPIO7 = none
# 8: no    pu | -- // GPIO8 = none
# 9: no    pd | -- // GPIO9 = none
# 10: no    pd | -- // GPIO10 = none
# 11: no    pd | -- // GPIO11 = none
# 12: no    pd | -- // GPIO12 = none
# 13: no    pd | -- // GPIO13 = none
# 14: a4    pn | hi // GPIO14 = TXD0
# 15: a4    pu | hi // GPIO15 = RXD0
# 16: no    pd | -- // GPIO16 = none
# 17: op dl pd | lo // GPIO17 = output
# 18: a3    pd | lo // GPIO18 = PWM0_CHAN2
# 19: no    pd | -- // GPIO19 = none
# 20: no    pd | -- // GPIO20 = none
# 21: no    pd | -- // GPIO21 = none
# 22: no    pd | -- // GPIO22 = none
# 23: no    pd | -- // GPIO23 = none
# 24: no    pd | -- // GPIO24 = none
# 25: no    pd | -- // GPIO25 = none
# 26: no    pd | -- // GPIO26 = none
# 27: op dl pd | lo // GPIO27 = output
# 28: no    pd | lo // PCIE_RP1_WAKE/GPIO28 = none
# 29: no    pu | hi // FAN_TACH/GPIO29 = none
# 30: no    pu | -- // HOST_SDA/GPIO30 = none
# 31: no    pu | -- // HOST_SCL/GPIO31 = none
# 32: op dh pd | hi // ETH_RST_N/GPIO32 = output
# 33: no    pd | lo // GPIO33 = none
# 34: op dl pd | lo // CD0_IO0_MICCLK/GPIO34 = output
# 35: no    pd | lo // CD0_IO0_MICDAT0/GPIO35 = none
# 36: no    pd | lo // RP1_PCIE_CLKREQ_N/GPIO36 = none
# 37: no    pd | lo // GPIO37 = none
# 38: ip    pd | hi // CD0_SDA/GPIO38 = input
# 39: ip    pd | hi // CD0_SCL/GPIO39 = input
# 40: ip    pd | hi // CD1_SDA/GPIO40 = input
# 41: ip    pd | hi // CD1_SCL/GPIO41 = input
# 42: a2    pd | hi // USB_VBUS_EN/GPIO42 = VBUS_EN1
# 43: a2    pu | hi // USB_OC_N/GPIO43 = VBUS_OC1
# 44: op dh pd | hi // RP1_STAT_LED/GPIO44 = output
# 45: a0    pd | hi // FAN_PWM/GPIO45 = PWM1_CHAN3
# 46: op dl pd | lo // CD1_IO0_MICCLK/GPIO46 = output
# 47: no    pd | lo // 2712_WAKE/GPIO47 = none
# 48: no    pd | lo // CD1_IO1_MICDAT1/GPIO48 = none
# 49: op dh pd | hi // EN_MAX_USB_CUR/GPIO49 = output
# 50: no    pd | -- // GPIO50 = none
# 51: no    pd | -- // GPIO51 = none
# 52: no    pu | -- // GPIO52 = none
# 53: no    pu | hi // GPIO53 = none
# 101: op dh pu | hi // 2712_BOOT_CS_N/GPIO1 = output
# 102: a7    pn | hi // 2712_BOOT_MISO/GPIO2 = VC_SPI0_MISO
# 103: a6    pn | hi // 2712_BOOT_MOSI/GPIO3 = VC_SPI0_MOSI
# 104: a6    pn | lo // 2712_BOOT_SCLK/GPIO4 = VC_SPI0_SCLK
# 110: ip    pd | lo // GPIO10 = input
# 111: ip    pd | lo // GPIO11 = input
# 112: ip    pd | lo // GPIO12 = input
# 113: ip    pd | lo // GPIO13 = input
# 114: a1    pd | lo // PCIE_SDA/GPIO14 = SPI_S_MOSI_OR_BSC_S_SDA
# 115: a1    pd | lo // PCIE_SCL/GPIO15 = SPI_S_SCK_OR_BSC_S_SCL
# 118: ip    pd | lo // GPIO18 = input
# 119: ip    pd | lo // GPIO19 = input
# 120: ip    pu | hi // PWR_GPIO/GPIO20 = input
# 121: ip    pd | lo // 2712_G21_FS/GPIO21 = input
# 122: ip    pu | hi // GPIO22 = input
# 123: ip    pd | lo // GPIO23 = input
# 124: a4    pn | lo // BT_RTS/GPIO24 = UART_RTS_0
# 125: a4    pu | lo // BT_CTS/GPIO25 = UART_CTS_0
# 126: a4    pn | hi // BT_TXD/GPIO26 = UART_TXD_0
# 127: a4    pu | hi // BT_RXD/GPIO27 = UART_RXD_0
# 128: op dh pd | hi // WL_ON/GPIO28 = output
# 129: op dh pd | hi // BT_ON/GPIO29 = output
# 130: a1    pn | hi // WIFI_SDIO_CLK/GPIO30 = SD2_CLK
# 131: a1    pu | hi // WIFI_SDIO_CMD/GPIO31 = SD2_CMD
# 132: a1    pu | hi // WIFI_SDIO_D0/GPIO32 = SD2_DAT0
# 133: a1    pu | hi // WIFI_SDIO_D1/GPIO33 = SD2_DAT1
# 134: a1    pu | hi // WIFI_SDIO_D2/GPIO34 = SD2_DAT2
# 135: a1    pu | hi // WIFI_SDIO_D3/GPIO35 = SD2_DAT3
# 200: a6    pd | hi // RP1_SDA/AON_GPIO0 = VC_SDA0
# 201: a7    pd | hi // RP1_SCL/AON_GPIO1 = VC_SCL0
# 202: op dh pd | hi // RP1_RUN/AON_GPIO2 = output
# 203: op dh pd | hi // SD_IOVDD_SEL/AON_GPIO3 = output
# 204: op dh pd | hi // SD_PWR_ON/AON_GPIO4 = output
# 205: a4    pu | lo // SD_CDET_N/AON_GPIO5 = SD_CARD_PRES_G
# 206: ip    pu | hi // SD_FLG_N/AON_GPIO6 = input
# 208: ip    pd | lo // 2712_WAKE/AON_GPIO8 = input
# 209: op dh pd | hi // 2712_STAT_LED/AON_GPIO9 = output
# 212: ip    pd | lo // PMIC_INT/AON_GPIO12 = input
# 213: a2    pu | hi // UART_TX_FS/AON_GPIO13 = VC_TXD0
# 214: a3    pu | hi // UART_RX_FS/AON_GPIO14 = VC_RXD0
# 232: a1    -- | hi // HDMI0_SCL/AON_SGPIO0 = HDMI_TX0_BSC_SCL
# 233: a1    -- | hi // HDMI0_SDA/AON_SGPIO1 = HDMI_TX0_BSC_SDA
# 234: a1    -- | hi // HDMI1_SCL/AON_SGPIO2 = HDMI_TX1_BSC_SCL
# 235: a1    -- | hi // HDMI1_SDA/AON_SGPIO3 = HDMI_TX1_BSC_SDA
# 236: a2    -- | hi // PMIC_SCL/AON_SGPIO4 = BSC_M2_SCL
# 237: a2    -- | hi // PMIC_SDA/AON_SGPIO5 = BSC_M2_SDA
pinctrl get

# Raspberry PI command to Display PWM Chips
# total 0
# lrwxrwxrwx 1 root root 0 May  3 16:46 pwmchip0 -> ../../devices/platform/axi/1000120000.pcie/1f00098000.pwm/pwm/pwmchip0
# lrwxrwxrwx 1 root root 0 May  3 16:46 pwmchip1 -> ../../devices/platform/axi/1000120000.pcie/1f0009c000.pwm/pwm/pwmchip1
ls -l /sys/class/pwm/

# Raspberry PI command to list PWM devices
# 4 PWM devices per PWM chip
#
# 0: platform/1f00098000.pwm, 4 PWM devices
#  pwm-0   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
#  pwm-1   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
#  pwm-2   (sysfs               ): requested period: 10000000 ns duty: 4000000 ns polarity: normal
#  pwm-3   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
#
# 1: platform/1f0009c000.pwm, 4 PWM devices
#  pwm-0   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
#  pwm-1   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
#  pwm-2   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
#  pwm-3   (cooling_fan         ): requested period: 41566 ns duty: 0 ns polarity: inverse usage_power
sudo cat /sys/kernel/debug/pwm

# Export the Channel (Only needed once per boot)
echo 2 | sudo tee /sys/class/pwm/pwmchip0/export

# Set the Period ($100\text{Hz}$ = $10,000,000\text{ ns}$)
echo 10000000 | sudo tee /sys/class/pwm/pwmchip0/pwm2/period

# Set the Duty Cycle ($85\%$ = $8,500,000\text{ ns}$)
echo 8500000 | sudo tee /sys/class/pwm/pwmchip0/pwm2/duty_cycle

# Start the Engine (Enable)
echo 1 | sudo tee /sys/class/pwm/pwmchip0/pwm2/enable

# Stop the Engine (Disable)
echo 0 | sudo tee /sys/class/pwm/pwmchip0/pwm2/enable


pinctrl set 17 op dh  # Set GPIO 17 to Output, Drive High
pinctrl set 27 op dl  # Set GPIO 27 to Output, Drive Low

pinctrl set 17 op dl  # Set GPIO 17 to Output, Drive Low
pinctrl set 27 op dh  # Set GPIO 27 to Output, Drive High
