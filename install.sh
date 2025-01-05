#!/bin/bash


# Save multi-line text with preserved indentation
arch_update_script=$(cat <<-EOF
[arch-update]
command=/home/$USER/.config/i3/scripts/arch-update 
interval=3600
markup=pango
LABEL=: 

EOF
)

calendar_script=$(cat <<-EOF
[calendar]
command=/home/$USER/.config/i3/scripts/calendar
interval=1
LABEL= 
DATEFMT=+%a %d.%m.%Y %H:%M:%S
# SHORTFMT=+%H:%M:%S
HEIGHT=180
WIDTH=200
# SET HORIZONTAL ADJUSTMENT
instance=65

EOF
)

rofi_wttr_script=$(cat <<-EOF
[rofi-wttr]
command=/home/$USER/.config/i3/scripts/rofi-wttr
interval=3600
#BAR_POSITION=top
#FONT=Monospace 10
#LABEL=🌡️
#LOCATION=Tromso

EOF
)

battery_script=$(cat <<-EOF
[battery2]
command=/home/$USER/.config/i3/scripts/battery2
markup=pango
interval=30

EOF
)

disk_script=$(cat <<-EOF
[disk]
command=/home/$USER/.config/i3/scripts/disk
LABEL= 
#DIR=$HOME
#ALERT_LOW=10
interval=30

EOF
)

memory_script=$(cat <<-EOF
[memory]
command=/home/$USER/.config/i3/scripts/memory
markup=pango
label=MEM 
interval=30

EOF
)

gpu_script=$(cat <<-EOF
[gpu-load]
command=/home/$USER/.config/i3/scripts/gpu-load
label=GPU 
interval=10
#min_width=GPU 100% 100% 100% 100%
#GPU_BRAND=NVIDIA // or AMD
#T_WARN=70
#T_CRIT=90

EOF
)

cpu_script=$(cat <<-EOF
[cpu_usage]
command=/home/$USER/.config/i3/scripts/cpu_usage
interval=10
LABEL=CPU 
#min_width=CPU: 100.00%
#T_WARN=50
#T_CRIT=80
#DECIMALS=2
#COLOR_NORMAL=#EBDBB2
#COLOR_WARN=#FFFC00
#COLOR_CRIT=#FF0000

EOF
)

ip_script=$(cat <<-EOF
[iface]
command=/home/$USER/.config/i3/scripts/iface
#LABEL=wlan0:
#IFACE=wlan0
#ADDRESS_FAMILY=inet6?
color=#9fff9f
interval=10
# set this to 1 to display the name of the connected WIFI interface instead of the IP address.
display_wifi_name=0

EOF
)

bandwidth_script=$(cat <<-EOF
[bandwidth3]
command=/home/$USER/.config/i3/scripts/bandwidth3
interval=persist
markup=pango
#LABEL=<span font='FontAwesome'>  </span>
#IFACE=[automatically determined]
#DT=3
#UNIT=Mb
# Exposed variables: rx, wx, tx, unit, iface
#PRINTF_COMMAND=printf "${LABEL}%-5.1f/%5.1f %s/s\n", rx, wx, unit;

EOF
)

screenshot_script=$(cat <<-EOF
[flameshot]
command=/home/$USER/.config/i3/scripts/flameshot.sh
interval=once
signal=1

EOF
)

volume_script=$(cat <<-EOF
[volume-pipewire]
command=/home/$USER/.config/i3/scripts/volume-pipewire
interval=once
signal=1
#MIXER=[determined automatically]
#SCONTROL=[determined automatically]
##exposed format variables: ${SYMB}, ${VOL}, ${INDEX}, ${NAME}
#LONG_FORMAT="${SYMB} ${VOL}% [${INDEX}:${NAME}]"
#SHORT_FORMAT="${SYMB} ${VOL}% [${INDEX}]"
#AUDIO_HIGH_SYMBOL='  '
#AUDIO_MED_THRESH=50
#AUDIO_MED_SYMBOL='  '
#AUDIO_LOW_THRESH=0
#AUDIO_LOW_SYMBOL='  '
#AUDIO_DELTA=5
#DEFAULT_COLOR="#ffffff"
#MUTED_COLOR="#a0a0a0"
#USE_ALSA_NAME=0
#USE_DESCRIPTION=0
## SUBSCRIBE=1 requires interval=persist and always uses LONG_FORMAT
#SUBSCRIBE=0

EOF
)

spotify_script=$(cat <<-EOF
[spotify]
label= 
command=/home/$USER/.config/i3/scripts/spotify.py
color=#81b71a
interval=5

EOF
)

# Display the options
echo "Select the block that you want (you can choose multiple, separated by spaces):"
echo "1) arch-update"
echo "2) calendar"
echo "3) rofi-wttr"
echo "4) battery"
echo "5) disk"
echo "6) memory-load"
echo "7) GPU-load"
echo "8) CPU-load"
echo "9) IP"
echo "10) bandwidth"
echo "11) screenshot tool"
echo "12) volume"
echo "13) spotify"
echo "14) Quit"

# Prompt for user input
read -p "Enter the numbers of your choices (e.g., 1 3 4): " choices

i3blocks_rules=$(cat <<-EOF
# Global properties
separator=true
separator_block_width=15
EOF
)

echo "$i3blocks_rules\n" > ./i3blocks/i3blocksTest.conf
echo -e "\n" >> ./i3blocks/i3blocksTest.conf

# Process the input
for choice in $choices; do
    case $choice in
        14)
            echo "Terminating install"
            exit 0
            ;;
        13)
            echo -e "$spotify_script\n" >> ./i3blocks/i3blocksTest.conf
            echo "spotify chosen!"
            ;;
        12)
            echo -e "$volume_script\n" >> ./i3blocks/i3blocksTest.conf
            echo "volume chosen!"
            ;;
        11)
            echo -e "$screenshot_script\n" >> ./i3blocks/i3blocksTest.conf
            echo "screenshot chosen!"
            ;;
        10)
            echo -e "$bandwidth_script\n" >> ./i3blocks/i3blocksTest.conf
            echo "bandwidth chosen!"
            ;;
        9)
            echo -e "$ip_script\n" >> ./i3blocks/i3blocksTest.conf
            echo "IP chosen!"
            ;;
        8)
            echo -e "$cpu_script\n" >> ./i3blocks/i3blocksTest.conf
            echo "cpu chosen!"
            ;;
        7)
            echo -e "$gpu_script\n" >> ./i3blocks/i3blocksTest.conf
            echo "gpu chosen!"
            ;;
        6)
            echo -e "$memory_script\n" >> ./i3blocks/i3blocksTest.conf
            echo "memory chosen!"
            ;;
        5)
            echo -e "$disk_script\n" >> ./i3blocks/i3blocksTest.conf
            echo "disk chosen!"
            ;;
        4)
            echo -e "$battery_script\n" >> ./i3blocks/i3blocksTest.conf
            echo "battery chosen!"
            ;;
        3)
            echo -e "$rofi_wttr_script\n" >> ./i3blocks/i3blocksTest.conf
            echo "rofi-wttr chosen!"
            ;;
        2)
            echo -e "$calendar_script\n" >> ./i3blocks/i3blocksTest.conf
            echo "calendar chosen!"
            ;;
        1)
            echo -e "$arch_update_script\n" >> ./i3blocks/i3blocksTest.conf
            echo "arch-update chosen!"
            ;;
          *)
            echo "Invalid choice: $choice>"
            ;;
    esac
done

