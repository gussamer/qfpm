#!/usr/bin/env node
const fpackageJSON = require('fs').readFileSync(process.cwd()+'/sfdx-project.json')
const fpack = JSON.parse(fpackageJSON)
var dirString = ''
fpack.packageDirectories.forEach(dir => {
  if(dirString=='') dirString+=process.cwd()+'/'+dir.path
  else dirString+=','+process.cwd()+'/'+dir.path
});
console.log(dirString)