#!/usr/bin/env bash
echo "[!] clean PWD: $PWD"
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
echo "[+] checking if $DXPM_SETUP_PACKAGE_NAME scrach org exists and deleting it"
$DXPM_NODE_MOD/.bin/qisscratched && sf org delete scratch -o "$DXPM_SETUP_PACKAGE_NAME" -p && wait
echo "[+] finished cleaning $DXPM_SETUP_PACKAGE_NAME scrach org"