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
    format_muted='🔇 {volume}',
)

# CPU temperature
if os.path.exists('/sys/class/thermal/thermal_zone0/temp'):
    status.register('temp', format='{temp:.0f}°C',)

status.register(
    'solaar',
    nameOfDevice='Performance Mouse MX'
)

# Battery status
status.register(
    'battery',
    format=(
        '{status} {consumption:.2f}W {percentage:.2f}% {remaining:%E%h:%M}'
    ),
    status={
        'DIS': '\uf243',
        'CHR': '\uf242',
        'FULL': '\uf240'
    },
    alert=True,
    alert_percentage=5,
)

# Free disk space
status.register('disk', path='/', format='{avail}GiB',)

# Network and public IP
status.register(
    'network',
    format_down='',
    interface='wlan0',
    format_up='\uf1eb {essid}',
)
status.register(
    'network',
    format_down='',
    interface='eth0',
    format_up='{interface}'
)

# Internet connectivity
status.register(
    'online',
    hints={
        'separator': False,
    },
    color='#00FF00',
    format_online='\uf0ac',
    format_offline='\uf0ac offline',

)

status.run()
