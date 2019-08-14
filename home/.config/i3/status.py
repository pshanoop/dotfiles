#!/usr/bin/env python
# -*- coding: utf-8 -*-

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
status.register(
    'battery',
    format=(
        '{status}{consumption:.1f}W {percentage:.1f}% {remaining:%E%h:%M}'
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
    command=(
        "khal list now -df 'SKIPME' | "  # tag headers as SKIPME
        "grep -v SKIPME | "  # filter out headers
        "grep -v -P '↦|↔ |⇥' | "  # filter out continuing all day events
        "grep -v '\[Lunch\]' | "  # filter out lunch
        "grep -v '^ ' | "  # exclude full-day events
        "head -n 1"  # show just the first
    ),
    interval=60,
)

status.run()
