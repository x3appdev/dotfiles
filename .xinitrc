#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# format keyboard layout
setxkbmap -model abnt2 -layout br

# update x resources db
xrdb -merge ~/.Xresources

# disable beep sound
xset b off

# start xscreensaver
xscreensaver -nosplash &

# VirtualBox guest
#VBoxClient-all

# start awesome
exec awesome
