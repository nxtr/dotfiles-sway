#!/bin/bash

OPT=$(echo -e "lock\nterminate\nsuspend\nhibernate\nreboot\npoweroff" | fuzzel -b 000000ff -l 6 -d)

export SUDO_ASKPASS=$HOME/.config/sway/askpass

case $OPT in
        lock) loginctl lock-session $XDG_SESSION_ID ;;
        terminate) sudo -Ak loginctl terminate-session $XDG_SESSION_ID ;;
        suspend) sudo -Ak systemctl suspend ;;
        hibernate) sudo -Ak systemctl hibernate ;;
        reboot) sudo -Ak systemctl reboot ;;
        poweroff) sudo -Ak systemctl poweroff ;;
        *) ;;
esac
