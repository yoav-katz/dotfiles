#!/bin/bash

AC_STATE=0

for f in /sys/class/power_supply/AC*/online; do
    if [ -f "$f" ]; then
        AC_STATE=$(cat "$f")
        break
    fi
done

if [ "$AC_STATE" = "1" ]; then
    LOCK=900
    DPMS=1200
else
    LOCK=300
    DPMS=330
fi

cat > ~/.config/hypr/idle.conf <<EOF
listener {
    timeout = $LOCK
    on-timeout = loginctl lock-session
}

listener {
    timeout = $DPMS
    on-timeout = hyprctl dispatch dpms off
    on-resume = hyprctl dispatch dpms on && brightnessctl -r
}
EOF

hyprctl reload
