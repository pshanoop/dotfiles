#!/usr/bin/env python
# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status
from i3pystatus.mail.maildir import MaildirMail

status = Status(standalone=True)

# Current time
status.register("clock", format="%Y-%m-%d %X")

# Volume
status.register("pulseaudio", format="♪{volume}",)

# CPU temperature
status.register("temp", format="{temp:.0f}°C",)

# Battery status
status.register("battery",
                format="{status}/{consumption:.2f}W {percentage:.2f}%" +
                " {remaining:%E%hh:%Mm}",
                status={"DIS": "↓", "CHR": "↑", "FULL": "="},
                alert=True, alert_percentage=5,
                )

# Status of the wired network
status.register("network", interface="eth0", format_up="{interface}",)

# Wireless status/signal
status.register("wireless", interface="wlan0",
                format_up="{essid} {quality:.0f}%",)

# Free disk space
status.register("disk", path="/", format="{avail}GiB",)

# Unread email count
inbox = MaildirMail(directory="/home/hugo/.local/share/maildir/Personal/INBOX")
status.register("mail", backends=[inbox])

# Public IP
status.register("network", format_down="", interface="wlan0", format_up="{v6}")
status.register("network", format_down="", interface="eth0", format_up="{v6}")

status.run()
