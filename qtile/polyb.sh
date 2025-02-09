#!/bin/bash

if pgrep -x "polybar" > /dev/null; then
    pkill -x polybar
else
    polybar &
fi
