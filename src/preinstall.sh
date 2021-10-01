#!/usr/bin/env bash
echo "[!] preinstall PWD: $PWD"
echo "[!] preinstall INIT_CWD: $INIT_CWD"
if [ "$DXPM_NODE_MOD" = "" ]; then
  if [[ "$PWD" != *"node_modules"* ]]; then
    DXPM_NODE_MOD="$PWD/node_modules"
  else
    DXPM_NODE_MOD=$(echo $PWD | sed -r "s|^(.*/node_modules)/(.*)$|\1|g")
  fi
fi
DXPM_SETUP_PACKAGE_NAME="$($DXPM_NODE_MOD/.bin/qgetprojectname $INIT_CWD)"
DXPM_CURRENT_PACKAGE_NAME="$($DXPM_NODE_MOD/.bin/qgetprojectname)"
echo "[!] preinstall DXPM_SETUP_PACKAGE_NAME: $DXPM_SETUP_PACKAGE_NAME"
echo "[!] preinstall DXPM_CURRENT_PACKAGE_NAME: $DXPM_CURRENT_PACKAGE_NAME"
echo "[+] begin install of $DXPM_CURRENT_PACKAGE_NAME"
if [ "$DXPM_SETUP_PACKAGE_NAME" = "$DXPM_CURRENT_PACKAGE_NAME" ]; then
  echo "[+] removing dependancies for $DXPM_CURRENT_PACKAGE_NAME to force reinstall"
  $DXPM_NODE_MOD/.bin/qremovedepends
  echo "[+] finished removing dependancies for $DXPM_CURRENT_PACKAGE_NAME"
fi