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
    format_muted='🔇',
)

# CPU temperature
if os.path.exists('/sys/class/thermal/thermal_zone0/temp'):
    status.register('temp', format='{temp:.0f}°C',)

# Battery status
status.register(
    'battery',
    format=(
        '{status} {consumption:.2f}W {percentage:.2f}% {remaining:%E%h:%M}'
    ),
    status={
        'DIS': '\uf078',
        'CHR': '\uf077',
        'FULL': '\uf240'
    },
    alert=True,
    not_present_text='',
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
    format_online='\uf0ac',
    format_offline='\uf0ac',

)

status.run()
