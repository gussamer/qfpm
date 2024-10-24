#!/usr/bin/env bash
if [ "$DXPM_NODE_MOD" = "" ]; then
  if [[ "$PWD" != *"node_modules"* ]]; then
    DXPM_NODE_MOD="$PWD/node_modules"
  else
    DXPM_NODE_MOD=$(echo $PWD | sed -r "s|^(.*/node_modules)/(.*)$|\1|g")
  fi
fi
DXPM_SETUP_PACKAGE_NAME="$1"
if [ "$DXPM_SETUP_PACKAGE_NAME" = "" ]; then
  DXPM_SETUP_PACKAGE_NAME="$($DXPM_NODE_MOD/.bin/qgetprojectname)"
fi
echo "[+] setting up scratch org $DXPM_SETUP_PACKAGE_NAME"
sf force org create -f $PWD/config/project-scratch-def.json -a "$DXPM_SETUP_PACKAGE_NAME" -d 1 -w 5 && wait
echo "[+] finished setting up scratch org $DXPM_SETUP_PACKAGE_NAME"
echo "[+] setting scratch org $DXPM_SETUP_PACKAGE_NAME as default locally"
sf force config set target-org $DXPM_SETUP_PACKAGE_NAME
echo "[+] finished setting scratch org $DXPM_SETUP_PACKAGE_NAME as default username locally"