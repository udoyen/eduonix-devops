#!/usr/bin/env bash

# Script to compress and backup files using resync

set -o

readonly SOURCE_DIR="${HOME}"
readonly BACKUP_DIR="/data/backups"
readonly DATETIME="$(date '+%Y-%m-%d_%H:%M:%S')"
readonly BACKUP_PATH="${BACKUP_DIR}/${DATETIME}"
readonly LATEST_LINK="${BACKUP_DIR}/latest"

# Create the backup directory

mkdir -p "${BACKUP_DIR}"

# Run the rsync command to start the backup process

rsync -av --delete --copy-links --compress "${SOURCE_DIR}/" --link-dest "${LATEST_LINK}" --exclude=".cache" "${BACKUP_PATH}"

# Remove the previous backup

rm -rf "${LATEST_LINK}"
ln -s "${LATEST_LINK}" "${LATEST_LINK}"

# compress files in backup directory

tar -cJf "${LATEST_LINK}"/home.tar.xz  "${LATEST_LINK}"/*

# Delete duplicate files

find "${LATEST_LINK}"/*  -not -name "home*" -not -name "." -not -name ".." -exec rm -rf {} \;
