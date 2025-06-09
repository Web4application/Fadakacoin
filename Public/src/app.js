const express = require('express');
const mongoose = require('mongoose');
const authRoutes = require('./routes/auth');
const resetRoutes = require('./routes/reset');
require('dotenv').config();

const app = express();
app.use(express.json());

// Database connection
mongoose.connect(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
}).then(() => {
    console.log('MongoDB connected');
}).catch((err) => {
    console.error(err);
});

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/reset', resetRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
