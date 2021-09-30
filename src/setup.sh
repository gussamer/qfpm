#!/usr/bin/env bash
export DXPM_SETUP_PACKAGE_NAME="$(node $PWD/bin/qfpm/getprojectname.js)"
export DXPM_CURRENT_PACKAGE_NAME="$DXPM_SETUP_PACKAGE_NAME"
echo "[+] checking if $DXPM_SETUP_PACKAGE_NAME scrach org exists or creating it"
node $PWD/bin/qfpm/isscratched.js || bash $PWD/bin/qfpm/scratch.sh && wait
echo "[+] installing package $DXPM_SETUP_PACKAGE_NAME"
npm install --only=prod && wait
echo "[+] finished installing package $DXPM_SETUP_PACKAGE_NAME"
export DXPM_CURRENT_PACKAGE_NAME=""
export DXPM_SETUP_PACKAGE_NAME=""