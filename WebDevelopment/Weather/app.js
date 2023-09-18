import bodyParser from 'body-parser';
import express from 'express';
import https from 'https';
import path from 'path';
import { fileURLToPath } from 'url';
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const app = express();
app.use(bodyParser.urlencoded({extended:true}));



app.listen(3000, function(){
    console.log("Listening to 3000 !")
})



app.get('/', function (req, res) {
    res.sendFile(__dirname+"/index.html");
});



app.post("/", function(req,res){
    const cityName = req.body.cityName;
    const url = "https://api.openweathermap.org/data/2.5/weather?q="+cityName+"&appid=3f037a707d37b488fa52c356cfda20d8&units=metric"
    https.get(url, function (response){
        response.on("data",function(data){
            const weatherData = JSON.parse(data)
            const temp = weatherData.main.temp;
            res.send("<h1>The tempareature in " + cityName+ " is " + temp + " degree Celsius</h1>");
        })
    })
})

