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
DXPM_CURRENT_PACKAGE_NAME="$2"
if [ "$DXPM_CURRENT_PACKAGE_NAME" = "" ]; then
  DXPM_CURRENT_PACKAGE_NAME="$DXPM_SETUP_PACKAGE_NAME"
fi
echo "[+] deploying $DXPM_CURRENT_PACKAGE_NAME metadata to scratch org $DXPM_SETUP_PACKAGE_NAME"
#todo: read package.json for all folder locations
sf force source deploy -p "$($DXPM_NODE_MOD/.bin/qgetsrcfolders)" -w 10 -u "$DXPM_SETUP_PACKAGE_NAME" && wait
echo "[+] finished deploying $DXPM_CURRENT_PACKAGE_NAME metadata to scratch org $DXPM_SETUP_PACKAGE_NAME"