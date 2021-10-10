#!/usr/bash

# Script to compress and backup files using resync

set -o

readonly SOURCE_DIR="${HOME}"
readonly BACKUP_DIR="/data/backups"
readonly DATETIME="$(date '+%Y-%m-%d_%H:%M:%S')"
readonly BACKUP_PATH="${BACKUP_DIR}/${DATETIME}"
readonly LATES_LINK="${BACKUP_DIR}/latest"

# Create the backup directory

mkdir -p "${BACKUP_DIR}"

# Compress the home directory



# Run the rsync command to start the backup process

rsync -av --delete --copy-links --compress "${SOURCE_DIR}/" --link-dest "${LATEST_LINK}" --exclude=".cache" "${BACKUP_PATH}"


# Remove the previous backup

rm -rf "${LATEST_LINK}"
ln -s "${BACKUP_PATH}" "${LATEST_LINK}"
