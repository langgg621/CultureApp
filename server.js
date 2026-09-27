require('dotenv').config();
const express = require('express');
const mysql = require('mysql2/promise');
const routes = require('./Routes');
const { errorHandler, notFoundHandler } = require('./Middlewares');

// Initialize app
const app = express();

// 1. Body Parsing Middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// 2. Database Connection Pool 
const db = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// Check connection Database when start
(async () => {
    try {
        const connection = await db.getConnection();
        console.log('MySQL Connected successfully!');
        connection.release();
    } catch (err) {
        console.error('MySQL Connection Error:', err.message);
    }
})();

// Route check status Server (Health check)
app.get('/', (req, res) => {
    res.json({
        success: true,
        message: 'CultureApp API Server is running'
    });
});
// 3. Register API Routes
app.use('/api', routes(db));

// 4. Error Middlewares 
app.use(notFoundHandler); // Error 404 Route Not found
app.use(errorHandler);    // Error Server 500

// 5. Start Server
const PORT = process.env.PORT;
app.listen(PORT, () => {
    console.log(`Server running http://localhost:${PORT}`);
});