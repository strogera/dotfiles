dunst &
sxhkd &
udiskie &
setxkbmap -layout us,el -variant ,polytonic -option grp:alt_caps_toggle
amixer sset 'Master' 40%
light -S 30

/usr/bin/aw-server/aw-server &
/usr/bin/aw-watcher-afk/aw-watcher-afk &
/usr/bin/aw-watcher-window/aw-watcher-window &  

/usr/local/dwm-bar/dwm_bar.sh &
st
