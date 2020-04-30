const mysql = require('mysql');

const db = mysql.createConnection({
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_USER || "root",
  password: process.env.DB_PASSWORD || "tunt1205",
  database: process.env.DB_NAME || "hotel_manager"
});

module.exports = db