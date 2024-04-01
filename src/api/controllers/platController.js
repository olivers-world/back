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

exports.getPlatsByTypes = (req, res) => {
  const getPlatsQuery = `SELECT * FROM Plats`;

  db.query(getPlatsQuery, (err, results) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else {
      // Group by types without removing the Types property from platData
      const categorizedPlats = results.reduce((acc, current) => {
        const { Types } = current;
        if (!acc[Types]) {
          acc[Types] = [];
        }
        acc[Types].push(current); // Keep the entire object, including its Types
        return acc;
      }, {});

      return res.status(200).json(categorizedPlats);
    }
  });
};

exports.updatePlats = (req, res) => {
  const { id, newNom, newPrix, newTypes } = req.body;

  if (!(id && (newNom || newPrix || newTypes))) {
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
  updateQuery += ` WHERE ID = ?`;
  queryParams.push(id);

  db.query(updateQuery, queryParams, (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Plat not found" });
    } else {
      return res.status(200).json({ message: "Plat updated successfully" });
    }
  });
};

exports.deletePlats = (req, res) => {
  const { id } = req.body;

  if (!id) {
    return res.status(400).json({ message: "Plat ID is required" });
  }

  const deleteQuery = `DELETE FROM Plats WHERE ID = ?`;

  db.query(deleteQuery, [id], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Plat not found" });
    } else {
      return res.status(200).json({ message: "Plat deleted successfully" });
    }
  });
};
