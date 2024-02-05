#!/bin/bash

click() {
    python ~/.calcurse/bar_click.py
    python ~/.calcurse/todo.py
}

trap "click" USR1

while true; do
    python ~/.calcurse/todo.py
    sleep 60 &
    wait
done

