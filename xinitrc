#!/bin/sh

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export INPUT_METHOD=fcitx

export QT_SCALE_FACTOR=1.5
export GDK_DPI_SCALE=1.25

export XCURSOR_SIZE=48
export XCURSOR_THEME=miku-cursor-linux

xsetroot -cursor_name left_ptr

pipewire &
picom &
dunst &
lowbat &
redshift -O 3500
fcitx5 &
alacritty -e new &

synclient TapButton1=1 TapButton2=3 TapButton3=2 \
            MinSpeed=4 MaxSpeed=4 AccelFactor=0

exec bspwm

