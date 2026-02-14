#!/bin/sh

xset r rate 200 30
setxkbmap -option compose:ralt

picom &
dunst &
lowbat &
unclutter &
redshift -O 3500
fcitx5 &
$TERMINAL_EMULATOR -e new &

if [ "$DISTRO" = "void" ]; then
    synclient TapButton1=1 TapButton2=3 TapButton3=2 \
		MinSpeed=4 MaxSpeed=4 AccelFactor=0 \
		PalmDetect=1
else
    xinput set-prop "MSFT0001:00 06CB:CE2D Touchpad" "libinput Tapping Enabled" 1
    xinput set-prop "MSFT0001:00 06CB:CE2D Touchpad" "libinput Accel Speed" 0.5
    xinput set-prop "MSFT0001:00 06CB:CE2D Touchpad" \
      "libinput Disable While Typing Enabled" 0
fi

exec i3
