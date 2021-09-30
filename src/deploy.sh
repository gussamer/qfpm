#!/usr/bin/env bash
DXPM_SETUP_PACKAGE_NAME="$1"
if [ "$DXPM_SETUP_PACKAGE_NAME" = "" ]; then
  DXPM_SETUP_PACKAGE_NAME="$(node $PWD/bin/qfpm/getprojectname.js)"
fi
DXPM_CURRENT_PACKAGE_NAME="$2"
if [ "$DXPM_CURRENT_PACKAGE_NAME" = "" ]; then
  DXPM_CURRENT_PACKAGE_NAME="$DXPM_SETUP_PACKAGE_NAME"
fi
echo "[+] deploying $DXPM_CURRENT_PACKAGE_NAME metadata to scratch org $DXPM_SETUP_PACKAGE_NAME"
#todo: read package.json for all folder locations
sfdx force:source:deploy -p "$(node $PWD/bin/qfpm/getsrcfolders.js)" -w 10 -u "$DXPM_SETUP_PACKAGE_NAME" && wait
echo "[+] finished deploying $DXPM_CURRENT_PACKAGE_NAME metadata to scratch org $DXPM_SETUP_PACKAGE_NAME"