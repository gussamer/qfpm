#!/usr/bin/env bash
export DXPM_SETUP_PATH="$PWD"
export DXPM_NODE_MOD="$PWD/node_modules"
export DXPM_SETUP_PACKAGE_NAME="$($DXPM_NODE_MOD/.bin/qgetprojectname)"
export DXPM_CURRENT_PACKAGE_NAME="$DXPM_SETUP_PACKAGE_NAME"
echo "[+] checking if $DXPM_SETUP_PACKAGE_NAME scrach org exists or creating it"
$DXPM_NODE_MOD/.bin/qisscratched || $DXPM_NODE_MOD/.bin/qscratch && wait
echo "[+] installing package $DXPM_SETUP_PACKAGE_NAME"
npm install --only=prod && wait
echo "[+] finished installing package $DXPM_SETUP_PACKAGE_NAME"
export DXPM_CURRENT_PACKAGE_NAME=""
export DXPM_SETUP_PACKAGE_NAME=""