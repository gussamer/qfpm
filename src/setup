#!/usr/bin/env bash
export DXPM_SETUP_PACKAGE_NAME="$($PWD/bin/qfpm/getprojectname)"
export DXPM_CURRENT_PACKAGE_NAME="$DXPM_SETUP_PACKAGE_NAME"
echo "[+] checking if $DXPM_SETUP_PACKAGE_NAME scrach org exists or creating it"
$PWD/bin/qfpm/isscratched || $PWD/bin/qfpm/scratch && wait
echo "[+] installing package $DXPM_SETUP_PACKAGE_NAME"
npm install --only=prod && wait
echo "[+] finished installing package $DXPM_SETUP_PACKAGE_NAME"
export DXPM_CURRENT_PACKAGE_NAME=""
export DXPM_SETUP_PACKAGE_NAME=""