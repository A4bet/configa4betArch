#!/bin/sh
xautolock -time 10 -locker "qtile cmd-obj -o cmd -f shutdown" -detectsleep &
