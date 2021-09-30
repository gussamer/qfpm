#!/usr/bin/env bash
echo "[!] preinstall PWD: $PWD"
echo "[!] preinstall INIT_CWD: $INIT_CWD"
DXPM_SETUP_PACKAGE_NAME="$(node $PWD/bin/qfpm/getprojectname.js $INIT_CWD)"
DXPM_CURRENT_PACKAGE_NAME="$(node $PWD/bin/qfpm/getprojectname.js)"
echo "[!] preinstall DXPM_SETUP_PACKAGE_NAME: $DXPM_SETUP_PACKAGE_NAME"
echo "[!] preinstall DXPM_CURRENT_PACKAGE_NAME: $DXPM_CURRENT_PACKAGE_NAME"
echo "[+] begin install of $DXPM_CURRENT_PACKAGE_NAME"
if [ "$DXPM_SETUP_PACKAGE_NAME" = "$DXPM_CURRENT_PACKAGE_NAME" ]; then
  echo "[+] removing dependancies for $DXPM_CURRENT_PACKAGE_NAME to force reinstall"
  bash $PWD/bin/qfpm/removedepends.sh
  echo "[+] finished removing dependancies for $DXPM_CURRENT_PACKAGE_NAME"
fi