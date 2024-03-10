const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cors = require('cors');
const bcrypt = require('bcrypt'); // You'll need to install bcrypt with `npm install bcrypt`

const app = express();
const port = 1945;

app.use(cors());
app.use(bodyParser.json());

const db = mysql.createConnection({
  host: '127.0.0.1',
  user: 'syn',
  password: 'admin',
  database: 'olivers-world',
});

db.connect((err) => {
  if (err) throw err;
  console.log('Connected to the MySQL database');
});

// Register endpoint
app.post('/register', async (req, res) => {
  const { user, pwd } = req.body;
  if (!(user && pwd)) {
    return res.status(400).json({ message: "Username and password are required" });
  }

  // Check if username matches the regex
  const userRegex = /^[A-z][A-z0-9-_]{3,23}$/;
  if (!userRegex.test(user)) {
    return res.status(400).json({ message: "Invalid username format" });
  }

  // Check if password matches the regex
  const pwdRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%]).{8,24}$/;
  if (!pwdRegex.test(pwd)) {
    return res.status(400).json({ message: "Invalid password format" });
  }

  // Check if username already exists
  const checkUserQuery = 'SELECT * FROM Users WHERE username = ?';
  db.query(checkUserQuery, [user], async (err, result) => {
    if (err) throw err;

    if (result.length > 0) {
      return res.status(409).json({ message: "Username already taken" });
    } else {
      // Hash password
      const hashedPwd = await bcrypt.hash(pwd, 10);

      // Insert new user into database
      const insertUserQuery = 'INSERT INTO Users (username, password) VALUES (?, ?)';
      db.query(insertUserQuery, [user, hashedPwd], (err, result) => {
        if (err) throw err;
        res.status(201).json({ message: "User registered successfully" });
      });
    }
  });
});

app.listen(port, () => {
  console.log(`Server started on http://localhost:${port}`);
});
