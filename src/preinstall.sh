#!/usr/bin/env bash
echo "[!] preinstall PWD: $PWD"
echo "[!] preinstall INIT_CWD: $INIT_CWD"
DXPM_SETUP_PACKAGE_NAME="$($PWD/bin/qfpm/getprojectname $INIT_CWD)"
DXPM_CURRENT_PACKAGE_NAME="$($PWD/bin/qfpm/getprojectname)"
echo "[!] preinstall DXPM_SETUP_PACKAGE_NAME: $DXPM_SETUP_PACKAGE_NAME"
echo "[!] preinstall DXPM_CURRENT_PACKAGE_NAME: $DXPM_CURRENT_PACKAGE_NAME"
echo "[+] begin install of $DXPM_CURRENT_PACKAGE_NAME"
if [ "$DXPM_SETUP_PACKAGE_NAME" = "$DXPM_CURRENT_PACKAGE_NAME" ]; then
  echo "[+] removing dependancies for $DXPM_CURRENT_PACKAGE_NAME to force reinstall"
  $PWD/bin/qfpm/removedepends
  echo "[+] finished removing dependancies for $DXPM_CURRENT_PACKAGE_NAME"
fi