const express = require('express')
const mongoose = require('mongoose')

const cors = require('cors')
const app = express();
app.use(cors())
app.use(express.json())
const UserModel = require('./models/Users.js')

mongoose.connect("mongodb+srv://mseeam99:iqbalRseeam99@crud-cluster.07g8whr.mongodb.net/CRUD-DATABASE?retryWrites=true&w=majority", {
}).then(() => {
    console.log("Successfully connected to DATABASE");
}).catch((error) => {
    console.error("Error connecting to DATABASE:", error);
});


app.get('/',(req,res)=>{
    UserModel.find({})
    .then(users=>res.json(users))
    .catch(err=>res.json(err))
})

app.get('/getUser/:id',(req,res)=>{
    const id = req.params.id;
    UserModel.findById({_id:id})
    .then(users=>res.json(users))
    .catch(err=>res.json(err))
 
})

app.delete('/deleteUser/:id',(req,res)=>{
    const id = req.params.id
    UserModel.findByIdAndDelete({_id:id})
    .then(res=>res.json(res))
    .catch(err=>res.json(err))
})

app.put('/updateUser/:id',(req,res)=>{
    const id = req.params.id
    UserModel.findByIdAndUpdate({_id:id}, 
    {Name:req.body.Name,Age:req.body.Age,Sex:req.body.Sex,Occupation:req.body.Occupation,Education:req.body.Education,Email:req.body.Email})
    .then(users=>res.json(users))
    .catch(err=>res.json(err))
})


app.post("/createUser",(req,res)=>{
    UserModel.create(req.body)
    .then(users=>res.json(users))
    .catch(err=>res.json(err))
})



const PORT = 3001

app.listen(PORT,()=>{
    console.log("Server running on PORT " + PORT)
})