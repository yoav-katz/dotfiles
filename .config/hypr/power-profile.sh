#!/bin/bash

AC_ON=$(upower -i $(upower -e | grep AC) | grep "online" | awk '{print $2}')

if [ "$AC_ON" = "yes" ]; then
    LOCK=900      # 15 minutes
    DPMS=1200     # 20 minutes
else
    LOCK=300      # 5 minutes
    DPMS=330      # ~5.5 minutes
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
