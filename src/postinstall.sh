#!/usr/bin/env bash
echo "[!] postinstall PWD: $PWD"
echo "[!] postinstall INIT_CWD: $INIT_CWD"
DXPM_SETUP_PACKAGE_NAME="$($PWD/bin/qfpm/getprojectname $INIT_CWD)"
DXPM_CURRENT_PACKAGE_NAME="$($PWD/bin/qfpm/getprojectname)"
echo "[!] postinstall DXPM_SETUP_PACKAGE_NAME: $DXPM_SETUP_PACKAGE_NAME"
echo "[!] postinstall DXPM_CURRENT_PACKAGE_NAME: $DXPM_CURRENT_PACKAGE_NAME"
echo "[+] check if $DXPM_CURRENT_PACKAGE_NAME is the setup package $DXPM_SETUP_PACKAGE_NAME or a dependancy of $DXPM_SETUP_PACKAGE_NAME"
if [ "$DXPM_SETUP_PACKAGE_NAME" = "$DXPM_CURRENT_PACKAGE_NAME" ]; then
  echo "[+] setting up for $DXPM_CURRENT_PACKAGE_NAME development and testing"
  $PWD/bin/qfpm/isscratched && bash ./bin/qfpm/push $DXPM_CURRENT_PACKAGE_NAME && wait
  echo "[+] finished setting up for $DXPM_CURRENT_PACKAGE_NAME development and testing"
else
  echo "[+] installing dependancy $DXPM_CURRENT_PACKAGE_NAME of $DXPM_SETUP_PACKAGE_NAME"
  $PWD/bin/qfpm/isscratched $DXPM_SETUP_PACKAGE_NAME && bash ./bin/qfpm/deploy $DXPM_SETUP_PACKAGE_NAME $DXPM_CURRENT_PACKAGE_NAME && wait
  echo "[+] finished installing dependancy $DXPM_CURRENT_PACKAGE_NAME of $DXPM_SETUP_PACKAGE_NAME"
fi