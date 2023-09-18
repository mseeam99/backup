import bodyParser from "body-parser";
import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express()
const port = 3000

app.use(bodyParser.urlencoded({extended:true}));

app.get("/", (req, res) => {
  res.sendFile(__dirname+"/index.html");
})

app.post("/", function(req,res){

    var number1 = Number(req.body.num1);
    var number2 = Number(req.body.num2);
    var result  = number1 + number2;
    res.send("The sum of " + number1 + " and " + number2 + " is " + result);

})

app.listen(port, () => {
  console.log(`App listening on port ${port}`)
})