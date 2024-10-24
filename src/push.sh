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
echo "[+] pushing source to scratch org $DXPM_SETUP_PACKAGE_NAME"
sf force source push -f -w 10 -o "$DXPM_SETUP_PACKAGE_NAME" && wait
echo "[+] finished pushing source to scratch org $DXPM_SETUP_PACKAGE_NAME"
