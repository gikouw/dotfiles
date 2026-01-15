#!/bin/sh

source ~/.xenv

xset r rate 300 25

picom &
dunst &
lowbat &
unclutter &
redshift -O 3500
fcitx5 &
alacritty -e new &

if [ -r /etc/os-release ]; then
    . /etc/os-release

    if [ "$ID" = "void" ]; then
    synclient TapButton1=1 TapButton2=3 TapButton3=2 \
		MinSpeed=4 MaxSpeed=4 AccelFactor=0
    else
	xinput set-prop "MSFT0001:00 06CB:CE2D Touchpad" "libinput Tapping Enabled" 1
	xinput set-prop "MSFT0001:00 06CB:CE2D Touchpad" "libinput Accel Speed" 0.5
	xinput set-prop "MSFT0001:00 06CB:CE2D Touchpad" \
	  "libinput Disable While Typing Enabled" 0
    fi
    pipewire &
    pipewire-pulse &
    wireplumber &

else
    echo "Cannot determine OS" >&2
    exit 1
fi

exec i3
