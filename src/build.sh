#!/usr/bin/env bash
echo "[!] build PWD: $PWD"
if [ "$DXPM_NODE_MOD" = "" ]; then
  if [[ "$PWD" != *"node_modules"* ]]; then
    DXPM_NODE_MOD="$PWD/node_modules"
  else
    DXPM_NODE_MOD=$(echo $PWD | sed -r "s|^(.*/node_modules)/(.*)$|\1|g")
  fi
fi
DXPM_CURRENT_PACKAGE_NAME="$1"
if [ "$DXPM_CURRENT_PACKAGE_NAME" = "" ]; then
  DXPM_CURRENT_PACKAGE_NAME="$($DXPM_NODE_MOD/.bin/qgetprojectname)"
fi
echo "[+] converting source for $DXPM_CURRENT_PACKAGE_NAME"
sfdx force:source:convert -d "./manifest" -n "$DXPM_CURRENT_PACKAGE_NAME" -p "$($DXPM_NODE_MOD/.bin/qgetsrcfolders)" && wait
echo "[+] finished converting source for $DXPM_CURRENT_PACKAGE_NAME"