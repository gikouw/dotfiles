#!/bin/sh

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export INPUT_METHOD=fcitx

#still some problems with i3 in void
#export XCURSOR_SIZE=48
#export XCURSOR_THEME=miku-cursor-linux
#xsetroot -cursor_name left_ptr
#xrdb -merge ~/.Xresources

pipewire &
picom &
dunst &
redshift -O 3500 
fcitx5 &

synclient TapButton1=1 TapButton2=3 TapButton3=2 \
            MinSpeed=3 MaxSpeed=3 AccelFactor=0

exec i3


