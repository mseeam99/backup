const mongoose = require('mongoose');
require('dotenv').config();

mongoose.connect(
  `mongodb+srv://${process.env.DB_DATABASE}:${process.env.DB_PASSWORD}@ally-cluster.dcmboyh.mongodb.net/?retryWrites=true&w=majority`,
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  }
);

// Event handler for successful connection
mongoose.connection.on('connected', () => {
  console.log('Connected to MongoDB database');
});

// Event handler for connection errors
mongoose.connection.on('error', (error) => {
  console.error('MongoDB connection error:', error);
});


