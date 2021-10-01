#!/usr/bin/env bash
if [ "$DXPM_NODE_MOD" = "" ]; then
  if [[ "$PWD" != *"node_modules"* ]]; then
    DXPM_NODE_MOD="$PWD/node_modules"
  else
    DXPM_NODE_MOD=$(echo $PWD | sed -r "s|^(.*/node_modules)/(.*)$|\1|g")
  fi
fi
folders="$(find $DXPM_NODE_MOD/ -name sfdx-project.json)"
folders="$(echo $folders | sed 's/\/sfdx-project.json//g')"
for val in $folders; do
    rm -fr $val
done