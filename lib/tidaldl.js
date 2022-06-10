import { exec } from "child_process";

export default function TidalDL() {
}


TidalDL.prototype.save = async function (url) {
  const command = `/usr/bin/tidal-dl ${url}`;
  console.log(`Executing: ${command}`);
  exec(command, (error, stdout, stderr) => {
      if (error) {
        console.error(`error: ${error}`);
      }
      if (stderr) {
        console.error(`stderr: ${stderr}`);
      }
      console.log(`stdout: ${stdout}`);
    });

  return {'save': true}

}
