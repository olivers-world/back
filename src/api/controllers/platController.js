require("dotenv").config();
const db = require("../../config/db.js");

exports.createPlats = (req, res) => {
  const { nom, prix, types } = req.body;

  if (!(nom && prix && types)) {
    return res
      .status(400)
      .json({ message: "Nom, prix, and types are required" });
  }

  const createPlatsQuery = `
        INSERT INTO Plats (Nom, Prix, Types)
        VALUES (?, ?, ?)
      `;

  db.query(createPlatsQuery, [nom, prix, types], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else {
      return res.status(201).json({
        message: "Plats creer avec succes",
      });
    }
  });
};

exports.getPlats = (req, res) => {
  const getPlatsQuery = `SELECT * FROM Plats`;

  db.query(getPlatsQuery, (err, results) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else {
      console.log(results);
      return res.status(200).json(results);
    }
  });
};

exports.updatePlats = (req, res) => {
  const { nom, newNom, newPrix, newTypes } = req.body;

  if (!(nom && newNom && newPrix)) {
    return res.status(400).json({ message: "Missing data for update" });
  }

  let updateQuery = `UPDATE Plats SET `;
  const queryParams = [];

  if (newNom) {
    updateQuery += `Nom = ?, `;
    queryParams.push(newNom);
  }
  if (newPrix) {
    updateQuery += `Prix = ?, `;
    queryParams.push(newPrix);
  }
  if (newTypes) {
    updateQuery += `Types = ?, `;
    queryParams.push(newTypes);
  }

  updateQuery = updateQuery.slice(0, -2);
  updateQuery += ` WHERE Nom = ?`;
  queryParams.push(nom);

  db.query(updateQuery, queryParams, (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Plats not found" });
    } else {
      return res.status(200).json({ message: "Plats updated successfully" });
    }
  });
};

exports.deletePlats = (req, res) => {
  const { nom } = req.body;

  if (!nom) {
    return res.status(400).json({ message: "Plats ID is required" });
  }

  const deleteQuery = `DELETE FROM Plats WHERE Nom = ?`;

  db.query(deleteQuery, [nom], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Plats not found" });
    } else {
      return res.status(200).json({ message: "Plats deleted successfully" });
    }
  });
};
