const mysql = require('mysql');

const db = mysql.createConnection({
  host: process.env.DB_HOST || "localhost:12345",
  user: process.env.DB_USER || "tunt",
  password: process.env.DB_PASSWORD || "120597",
  database: process.env.DB_NAME || "talatuda"
});

module.exports = db;