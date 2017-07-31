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
status.register('disk', path='/', format='{avail}GiB',)

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
    command="khal list now -df 'SKIPME' | grep -v SKIPME | head -n 1",
    interval=300,
)

status.run()
