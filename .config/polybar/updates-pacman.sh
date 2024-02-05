#!/bin/sh

if ! updates=$(checkupdates 2> /dev/null | wc -l ); then
    updates=0
fi

if [ "$updates" -gt 0 ]; then
    echo "🕉 $updates"
    notify-send -i ~/.config/polybar/arch.png "New updates: $updates"
else
    echo "🕉"
fi
