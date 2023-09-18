const mongoose = require('mongoose')

const UserSchema = new mongoose.Schema({
    Name:String,
    Age:String,
    Sex:String,
    Occupation:String,
    Education:String,
    Email:String
})

const UserModel = mongoose.model("users",UserSchema)

module.exports = UserModel