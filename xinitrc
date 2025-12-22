#!/bin/sh

source ~/.xenv

xsetroot -cursor_name left_ptr
xset r rate 300 25

pipewire &
picom &
dunst &
lowbat &
unclutter &
redshift -O 3500
fcitx5 &
alacritty -e new &

synclient TapButton1=1 TapButton2=3 TapButton3=2 \
            MinSpeed=4 MaxSpeed=4 AccelFactor=0

exec bspwm

