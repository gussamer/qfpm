#!/usr/bin/env node
var location
if(process.argv[2]==undefined) location=process.cwd()
else location=process.argv[2]
var packageJSON = require('fs').readFileSync(location+'/package.json')
var pack = JSON.parse(packageJSON)
if(pack['dependencies']!==undefined){    
    if(pack['dependencies'].hasOwnProperty('qfpm')) process.exit()
}
process.exit(1)