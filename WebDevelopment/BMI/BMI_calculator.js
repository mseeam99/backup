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
    var weight = Number(req.body.num1);
    var height = Number(req.body.num2);
    var BMI_Result  = (weight/(height^2));
    res.send("Your height is " + height + " m , Your weight is " + weight + " kg . Your BMI is " + BMI_Result);
    console.log("Your height is " + height + " m , Your weight is " + weight + " kg . Your BMI is " + BMI_Result);
})

app.listen(port, () => {
  console.log(`App listening on port ${port}`)
})