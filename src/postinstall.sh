#!/usr/bin/env bash
echo "[!] postinstall PWD: $PWD"
echo "[!] postinstall INIT_CWD: $INIT_CWD"
DXPM_SETUP_PACKAGE_NAME="$($PWD/node_modules/.bin/qgetprojectname $INIT_CWD)"
DXPM_CURRENT_PACKAGE_NAME="$($PWD/node_modules/.bin/qgetprojectname)"
echo "[!] postinstall DXPM_SETUP_PACKAGE_NAME: $DXPM_SETUP_PACKAGE_NAME"
echo "[!] postinstall DXPM_CURRENT_PACKAGE_NAME: $DXPM_CURRENT_PACKAGE_NAME"
echo "[+] check if $DXPM_CURRENT_PACKAGE_NAME is the setup package $DXPM_SETUP_PACKAGE_NAME or a dependancy of $DXPM_SETUP_PACKAGE_NAME"
if [ "$DXPM_SETUP_PACKAGE_NAME" = "$DXPM_CURRENT_PACKAGE_NAME" ]; then
  echo "[+] setting up for $DXPM_CURRENT_PACKAGE_NAME development and testing"
  $PWD/node_modules/.bin/qisscratched && bash $PWD/node_modules/.bin/qpush $DXPM_CURRENT_PACKAGE_NAME && wait
  echo "[+] finished setting up for $DXPM_CURRENT_PACKAGE_NAME development and testing"
else
  echo "[+] installing dependancy $DXPM_CURRENT_PACKAGE_NAME of $DXPM_SETUP_PACKAGE_NAME"
  $PWD/node_modules/.bin/qisscratched $DXPM_SETUP_PACKAGE_NAME && bash $PWD/bin/qfpm/deploy.sh $DXPM_SETUP_PACKAGE_NAME $DXPM_CURRENT_PACKAGE_NAME && wait
  echo "[+] finished installing dependancy $DXPM_CURRENT_PACKAGE_NAME of $DXPM_SETUP_PACKAGE_NAME"
fi