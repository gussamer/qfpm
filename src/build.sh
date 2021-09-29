#!/usr/bin/env bash
echo "build PWD: $PWD"
DXPM_CURRENT_PACKAGE_NAME="$1"
if [ "$DXPM_CURRENT_PACKAGE_NAME" = "" ]; then
  DXPM_CURRENT_PACKAGE_NAME="$($PWD/bin/qfpm/getprojectname)"
fi
echo "[+] converting source for $DXPM_CURRENT_PACKAGE_NAME"
sfdx force:source:convert -d "./manifest" -n "$DXPM_CURRENT_PACKAGE_NAME" -p "$($PWD/bin/qfpm/getsrcfolders)" && wait
echo "[+] finished converting source for $DXPM_CURRENT_PACKAGE_NAME"