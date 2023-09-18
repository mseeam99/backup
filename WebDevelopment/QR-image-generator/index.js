/* 
1. Use the inquirer npm package to get user input.
2. Use the qr-image npm package to turn the user entered URL into a QR code image.
3. Create a txt file to save the user input using the native fs node module.
*/

import fs from 'fs';
import inquirer from 'inquirer';
import qr from 'qr-image';

function qrCodeGenerator(){
  inquirer
  .prompt([
    {
        name: "URL",
        message:"Please enter the URL : ",
    }
  ])
  .then((answers) => {
    const url = answers.URL;
    var qr_svg = qr.image(url, { type: 'png' });
    qr_svg.pipe(fs.createWriteStream("new-QR-Image.png"));
    console.log("QR CODE SUCCESSFULLY GENERATED !")
  }).catch((error) => {
    if (error.isTtyError) {
      console.log("Prompt couldn't be rendered in the current environment ! ");
    } else {
        console.log("Something else went wrong ! ");
    }
  });
}

qrCodeGenerator();