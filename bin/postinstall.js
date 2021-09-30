console.log('[!] installing qfpm!')
const fs = require('fs')
const path = require('path')
const installPath = process.env.INIT_CWD
console.log(JSON.stringify(process.env))
const binPath = path.resolve(installPath,'bin')
const qfPath = path.resolve(binPath,'qfpm')
console.log('[!] building script path list!')
let scriptNames = []
let scripts = []
fs.readdirSync('./src').forEach(script => {
    scriptNames.push(script)
    scripts.push({
        name: script.slice(0,script.lastIndexOf('.'))
        ,path: path.resolve(qfPath,script)
        ,run: 'q'+script.slice(0,script.lastIndexOf('.'))
    })
})
console.log('[!] finished script paths list!')
console.log('[!] starting package.json update!')
let packJSON = fs.readFileSync(path.resolve(installPath,'package.json'))
let pack = JSON.parse(packJSON)
if(!pack.scripts){
    pack.scripts = {}
}
scripts.forEach(script => {
    pack.scripts[script.name] = './node_modules/.bin/'+script.run
})
fs.writeFileSync(path.resolve(installPath,'package.json'),JSON.stringify(pack,null,4))
console.log('[!] finished package.json update!')
console.log('[!] finished installing qfpm!')
