#!/usr/bin/env bash
folders="$(find $PWD/node_modules/ -name sfdx-project.json)"
folders="$(echo $folders | sed 's/\/sfdx-project.json//g')"
for val in $folders; do
    rm -fr $val
done