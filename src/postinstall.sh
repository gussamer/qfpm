#!/usr/bin/env bash
echo "[!] postinstall PWD: $PWD"
echo "[!] postinstall INIT_CWD: $INIT_CWD"
if [ "$DXPM_NODE_MOD" = "" ]; then
  if [[ "$PWD" != *"node_modules"* ]]; then
    DXPM_NODE_MOD="$PWD/node_modules"
  else
    DXPM_NODE_MOD=$(echo $PWD | sed -r "s|^(.*/node_modules)/(.*)$|\1|g")
  fi
fi
DXPM_SETUP_PACKAGE_NAME="$($DXPM_NODE_MOD/.bin/qgetprojectname $INIT_CWD)"
DXPM_CURRENT_PACKAGE_NAME="$($DXPM_NODE_MOD/.bin/qgetprojectname)"
echo "[!] postinstall DXPM_SETUP_PACKAGE_NAME: $DXPM_SETUP_PACKAGE_NAME"
echo "[!] postinstall DXPM_CURRENT_PACKAGE_NAME: $DXPM_CURRENT_PACKAGE_NAME"
echo "[+] check if $DXPM_CURRENT_PACKAGE_NAME is the setup package $DXPM_SETUP_PACKAGE_NAME or a dependancy of $DXPM_SETUP_PACKAGE_NAME"
if [ "$DXPM_SETUP_PACKAGE_NAME" = "$DXPM_CURRENT_PACKAGE_NAME" ]; then
  echo "[+] setting up for $DXPM_CURRENT_PACKAGE_NAME development and testing"
  $DXPM_NODE_MOD/.bin/qisscratched && $DXPM_NODE_MOD/.bin/qpush $DXPM_CURRENT_PACKAGE_NAME && wait
  echo "[+] finished setting up for $DXPM_CURRENT_PACKAGE_NAME development and testing"
else
  echo "[+] installing dependancy $DXPM_CURRENT_PACKAGE_NAME of $DXPM_SETUP_PACKAGE_NAME"
  $DXPM_NODE_MOD/.bin/qisscratched $DXPM_SETUP_PACKAGE_NAME && $DXPM_NODE_MOD/.bin/qdeploy $DXPM_SETUP_PACKAGE_NAME $DXPM_CURRENT_PACKAGE_NAME && wait
  echo "[+] finished installing dependancy $DXPM_CURRENT_PACKAGE_NAME of $DXPM_SETUP_PACKAGE_NAME"
fi