#!/usr/bin/env bash

echo "00 00 * * sun root ./rsync-backup.sh > /dev/null 2>&1" | crontab -
