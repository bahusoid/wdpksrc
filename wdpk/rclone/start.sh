#!/bin/sh

cd $(dirname $0)
source ./env

CONFIG=$(pwd)/rclone.config

[ ! -f /usr/bin/rclone ] echo "rclone not found" >> /tmp/debug_apkg

[ -f /tmp/debug_apkg ] echo "APKG_DEBUG: starting Rclone" >> /tmp/debug_apkg



ADDRESS=$(sed -n '/ip/ {s/.*<ip>\(\S*\)<\/ip>/\1/p;q}' /etc/NAS_CFG/config.xml )

# TODO: get user and pw from file
rclone rcd --config ${CONFIG} --rc-web-gui-no-open-browser --rc-addr ${ADDRESS}:${PORT:-5574} --rc-user ${RCLONE_USER:-mycloud} --rc-pass ${RCLONE_PW:-mycloud}
