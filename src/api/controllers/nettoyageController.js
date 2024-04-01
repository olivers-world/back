require("dotenv").config();
const db = require("../../config/db.js");
const dayjs = require('dayjs')

exports.createNettoyage = (req, res) => {
  const { date } = req.body;

  if (!date) {
    return res.status(400).json({ message: "Date is required" });
  }

  const createReservationQuery = `INSERT INTO Nettoyages (Date, Fait) VALUES (?, 0)`;

  db.query(
    createReservationQuery,
    [date],
    (err, result) => {
      if (err) {
        // Gérer les erreurs de la base de données ici
        return res.status(500).json({ message: "Database error", error: err });
      } else {
        // Réussite de l'insertion
        return res.status(201).json({ message: "Nettoyage creer avec succes" });
      }
    }
  );
};

exports.getMostRecentNettoyage = (req, res) => {
  const formattedToday = dayjs().format("YYYY-MM-DD");

  const getNettoyageQuery = `
  SELECT *, ABS(DATEDIFF(Date, '${formattedToday}')) AS DaysDifference
  FROM Nettoyages
  ORDER BY DaysDifference ASC, Date DESC
  LIMIT 1`;

  db.query(getNettoyageQuery, (err, results) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (results.length === 0) {
      return res.status(404).json({ message: "No inventaire found" });
    } else {
      return res.status(200).json(results[0]);
    }
  });
};

exports.updateNettoyage = (req, res) => {
  // Récupération de l'ID de la réservation à modifier ainsi que des nouvelles valeurs
  const { id, newDate, newIsDone } = req.body;

  // Validation des données reçues
  if (!(id && (newDate || newIsDone))) {
    return res.status(400).json({ message: "Missing data for update" });
  }

  // Construction de la requête SQL de mise à jour
  let updateQuery = `UPDATE Nettoyages SET `;
  const queryParams = [];

  if (newDate) {
    updateQuery += `Date = ?, `;
    queryParams.push(newDate);
  }

  if (newIsDone) {
    updateQuery += `Fait = ?, `;
    queryParams.push(newIsDone);
  }

  updateQuery = updateQuery.slice(0, -2); // Enlever la dernière virgule et espace
  updateQuery += ` WHERE ID = ?`;
  queryParams.push(id);

  // Exécution de la requête SQL pour mettre à jour la réservation
  db.query(updateQuery, queryParams, (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Nettoyage not found" });
    } else {
      return res
        .status(200)
        .json({ message: "Nettoyage updated successfully" });
    }
  });
};

exports.deleteNettoyage = (req, res) => {
  const { id } = req.body;

  if (!id) {
    return res.status(400).json({ message: "Nettoyage ID is required" });
  }

  const deleteQuery = `DELETE FROM Nettoyages WHERE ID = ?`;

  db.query(deleteQuery, [id], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Nettoyage not found" });
    } else {
      return res
        .status(200)
        .json({ message: "Nettoyage deleted successfully" });
    }
  });
};
