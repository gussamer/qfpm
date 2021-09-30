#!/usr/bin/env bash
echo "build PWD: $PWD"
DXPM_CURRENT_PACKAGE_NAME="$1"
if [ "$DXPM_CURRENT_PACKAGE_NAME" = "" ]; then
  DXPM_CURRENT_PACKAGE_NAME="$(node $PWD/bin/qfpm/getprojectname.js)"
fi
echo "[+] converting source for $DXPM_CURRENT_PACKAGE_NAME"
sfdx force:source:convert -d "./manifest" -n "$DXPM_CURRENT_PACKAGE_NAME" -p "$(node $PWD/bin/qfpm/getsrcfolders.js)" && wait
echo "[+] finished converting source for $DXPM_CURRENT_PACKAGE_NAME"