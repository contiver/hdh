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


# ====== dwm (dynamic window manager) settings below =====

# Start rtorrent
st -c st-exception -t st_rtorrent -e rtorrent &

# Set keyboard during X session to US altgr-intl
# TODO read documentation and find right place to set this instead of calling setxkbmap on startup
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl &

#st -t cmus -e cmus &

# Call .fehbg to set wallpaper
sh ~/.fehbg &

# Turn off keyboard backlight to save energy
asus-kbd-backlight off &

# Set Mod3key to the menu key in the ASUS UX51 laptop to use it in dwm
# Note: xmodmap is said to be deprecated and this should be ideally be done
# with setxkbmap. The sleep 1 is needed here because otherwise xkb loads before
# and overwrites the changes by xmodmap.
 ( sleep 1 &&  xmodmap ~/.Xmodmap) &

xcmenu --daemon &
dwmstatus &
exec dwm
