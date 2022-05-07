import { spawn } from "child_process";
// const util = require('node:util');
// const spawn = util.promisify(require('child_process').spawn);
export default function TidalDL() {
}


TidalDL.prototype.save = async function (url) {
  const command = `/usr/bin/tidal-dl -l ${url}`;
  console.log(`Executing: ${command}`);
  const child = spawn('/usr/bin/tidal-dl', ['-l', url]);

  child.stdout.on('data', (data) => {
    console.log(`child stdout:\n${data}`);
  });

  child.stderr.on('data', (data) => {
    console.error(`child stderr:\n${data}`);
  });

  console.log('returning');
  return {'save': true}

}
