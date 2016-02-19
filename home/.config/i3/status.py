#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os

from i3pystatus import Status
from i3pystatus.mail.maildir import MaildirMail

status = Status(standalone=True, click_events=False)

# Current time
status.register("clock", format="%a %Y-%m-%d %X")

# Volume
status.register("pulseaudio", format="♪{volume}",)

# CPU temperature
if os.path.exists("/sys/class/thermal/thermal_zone0/temp"):
    status.register("temp", format="{temp:.0f}°C",)

status.register(
    'solaar',
    nameOfDevice='Performance Mouse MX'
)

# Battery status
status.register("battery",
                format="{status}/{consumption:.2f}W {percentage:.2f}%" +
                " {remaining:%E%hh:%Mm}",
                status={"DIS": "↓", "CHR": "↑", "FULL": "="},
                alert=True, alert_percentage=5,
                )

# Free disk space
status.register("disk", path="/", format="{avail}GiB",)

# Unread email count
inbox = MaildirMail(directory="/home/hugo/.local/share/maildir/INBOX")
status.register(
    'mail',
    color_unread='#ffff00',
    backends=[inbox],
    format='{unread} new email',
    format_plural='{unread} new email',
)

# Internet connectivity
status.register(
    'online',
)

# Network and public IP
status.register(
    'network',
    format_down='',
    interface='wlan0',
    format_up='{v6} \uf1eb {essid}@{quality}%',
)
status.register(
    'network',
    format_down="",
    interface="eth0",
    format_up="{v6} @{interface}"
)

status.run()
