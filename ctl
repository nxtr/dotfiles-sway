#!/bin/bash

OPT=$(echo -e "lock\nterminate\nsuspend\nreboot\npoweroff" | fuzzel -b 000000ff -l 5 -d)

export SUDO_ASKPASS=$HOME/.config/sway/askpass

case $OPT in
        lock) loginctl lock-session $XDG_SESSION_ID ;;
        terminate) sudo -Ak loginctl terminate-session $XDG_SESSION_ID ;;
        suspend) sudo -Ak systemctl suspend ;;
        reboot) sudo -Ak systemctl reboot ;;
        poweroff) sudo -Ak systemctl poweroff ;;
        *) ;;
esac
