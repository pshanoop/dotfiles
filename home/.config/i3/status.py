#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os

from i3pystatus import Status

status = Status(standalone=True, click_events=False)

# Current time
status.register('clock', format='%a %Y-%m-%d %X')

# Volume
status.register(
    'pulseaudio',
    format='🔉 {volume}',
    format_muted='muted',
)

# Battery status
if os.path.exists('/sys/class/power_supply/BAT0/'):
    status.register(
        'battery',
        format=(
            '{status}{consumption:.2f}W {percentage:.2f}% {remaining:%E%h:%M}'
        ),
        status={
            'DIS': '↓',
            'CHR': '↑',
            'FULL': ' '
        },
        alert=True,
    )

# Free disk space
status.register(
    'disk',
    path='/',
    display_limit=20,
    format='{avail}GiB',
    round_size=1,
)

status.register(
    'shell',
    ignore_empty_stdout=True,
    command=(
        "nmcli con show --active | grep wifi | awk '{print $1 }'",
    ),
    interval=1,
)

# Internet connectivity
status.register(
    'online',
    hints={
        'separator': False,
    },
    color='#00FF00',
    format_online='',
    format_offline='',
)

status.register(
    'shell',
    command=(
        "khal list now -df 'SKIPME' | "  # tag headers as SKIPME
        "grep -v SKIPME | "  # filter out headers
        "grep -v '^ ' | "  # exclude full-day events
        "head -n 1"  # show just the first
    ),
    interval=60,
)

status.run()
