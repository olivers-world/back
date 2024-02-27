const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cors = require('cors');

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
  console.log('Connecté à la base de données MySQL');
});

// Exemple d'endpoint pour récupérer des données
app.get('/data', (req, res) => {
  const sqlQuery = 'SELECT * FROM Ingredients';
  db.query(sqlQuery, (err, result) => {
    if (err) throw err;
    res.json(result);
  });
});

app.listen(port, () => {
  console.log(`Serveur démarré sur http://localhost:${port}`);
});
