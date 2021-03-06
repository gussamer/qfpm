console.log('[!] installing qfpm!')
const fs = require('fs')
const path = require('path')
const installPath = process.env.INIT_CWD
const binPath = path.resolve(installPath,'bin')
const qfPath = path.resolve(binPath,'qfpm')
const binExists = fs.existsSync(binPath)
if(!binExists){
    fs.mkdirSync(binPath)
}
const qfpmAlreadyExists = fs.existsSync(qfPath)
if(!qfpmAlreadyExists){
    fs.mkdirSync(qfPath)
}
console.log('[!] starting script copy!')
let scriptNames = []
fs.readdirSync('./src').forEach(script => {
    fs.copyFileSync('./src/'+script,path.resolve(qfPath,script))
    scriptNames.push(script)
})
console.log('[!] finished script copy!')
console.log('[!] starting old script removal!')
fs.readdirSync(qfPath).forEach((script) => {
    if(scriptNames.indexOf(script)==-1){
        fs.unlinkSync(path.resolve(qfPath,script))
    }
})
console.log('[!] finished old script removal!')
console.log('[!] starting gitignore append!')
const ignorePath = path.resolve(installPath,'.gitignore')
if(fs.existsSync(ignorePath)){
    const ignore = fs.readFileSync(ignorePath)
    if(ignore.indexOf('bin/qfpm')==-1){
        fs.appendFileSync(ignorePath,'\n#qfpm\nbin/qfpm/\n')
    }
}else{
    fs.appendFileSync(ignorePath,'\n#qfpm\nbin/qfpm/\n')
}
console.log('[!] finished gitignore append!')
console.log('[!] starting package.json update!')
let packJSON = fs.readFileSync(path.resolve(installPath,'package.json'))
let pack = JSON.parse(packJSON)
if(!pack.scripts){
    pack.scripts = {}
}
scriptNames.forEach(script => {
    pack.scripts[script] = 'bash ./bin/qfpm/'+script
})
fs.writeFileSync(path.resolve(installPath,'package.json'),JSON.stringify(pack,null,4))
console.log('[!] finished package.json update!')
console.log('[!] finished installing qfpm!')
