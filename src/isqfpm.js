#!/usr/bin/env node
var packageJSON = require('fs').readFileSync(process.cwd()+'/package.json')
var pack = JSON.parse(packageJSON)
if(pack['dependencies']!==undefined){    
    if(pack['dependencies'].hasOwnProperty('qfpm')) process.exit()
}
process.exit(1)