#!/bin/sh

xrandr --output Virtual1 --primary
xrandr --output Virtual1 --dpi 160

vmware-user-suid-wrapper
