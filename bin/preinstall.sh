#!/usr/bin/env bash
cat "./etc/syklar.txt"
export QFPM_INSTALL_LOCATION="$PWD"
#if [ -d "$QFPM_INSTALL_LOCATION/bin/qfpm" ]; then
#  rm -fr "$QFPM_INSTALL_LOCATION/bin/qfpm"
#fi