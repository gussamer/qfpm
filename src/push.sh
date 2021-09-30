#!/usr/bin/env bash
DXPM_SETUP_PACKAGE_NAME="$1"
if [ "$DXPM_SETUP_PACKAGE_NAME" = "" ]; then
  DXPM_SETUP_PACKAGE_NAME="$($PWD/node_modules/.bin/qgetprojectname)"
fi
echo "[+] pushing source to scratch org $DXPM_SETUP_PACKAGE_NAME"
sfdx force:source:push -f -w 10 -u "$DXPM_SETUP_PACKAGE_NAME" && wait
echo "[+] finished pushing source to scratch org $DXPM_SETUP_PACKAGE_NAME"
