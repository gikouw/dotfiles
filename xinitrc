#!/bin/sh

#picom &
dunst &
unclutter &
redshift -O 3500 &
diodon &

xmisc &

run_local_startup_jobs &

exec i3
