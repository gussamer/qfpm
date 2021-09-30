#!/usr/bin/env bash
echo "clean PWD: $PWD"
DXPM_SETUP_PACKAGE_NAME="$1"
if [ "$DXPM_SETUP_PACKAGE_NAME" = "" ]; then
  DXPM_SETUP_PACKAGE_NAME="$(node $PWD/bin/qfpm/getprojectname.js)"
fi
echo "[+] checking if $DXPM_SETUP_PACKAGE_NAME scrach org exists and deleting it"
node $PWD/bin/qfpm/isscratched.js && sfdx force:org:delete -u "$DXPM_SETUP_PACKAGE_NAME" -p && wait
echo "[+] finished cleaning $DXPM_SETUP_PACKAGE_NAME scrach org"