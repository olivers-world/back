const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");
const bcrypt = require("bcrypt");

require("dotenv").config();
const authRoutes = require("./src/api/routes/authRoutes");

const app = express();
const port = process.env.PORT;

app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
});



// Utilisation des routes d'authentification
app.use("/api/auth", authRoutes);



db.connect((err) => {
  if (err) throw err;
  console.log("Connected to the MySQL database");
});

app.listen(port, () => {
  console.log(`Server started on http://localhost:${port}`);
});
