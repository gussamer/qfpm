#!/usr/bin/env node
'use strict'
const fs = require('fs')
console.log(fs.readFileSync('./etc/help.txt').toString())