require("dotenv").config();
const db = require("../../config/db.js");
const dayjs = require('dayjs')

exports.createInventaire = (req, res) => {
  // Ici, vous récupérez les données envoyées avec la requête POST.
  const { date } = req.body;

  // Valider les données reçues
  if (!date) {
    return res.status(400).json({ message: "Date is required" });
  }

  const createReservationQuery = `
        INSERT INTO Inventaires (Date, Fait)
        VALUES (?, 0)
      `;

  // Exécution de la requête SQL pour créer la réservation
  db.query(createReservationQuery, [date], (err, result) => {
    if (err) {
      // Gérer les erreurs de la base de données ici
      return res.status(500).json({ message: "Database error", error: err });
    } else {
      // Réussite de l'insertion
      return res.status(201).json({
        message: "Inventaire creer avec succes",
        reservationId: result.insertId,
      });
    }
  });
};

exports.getMostRecentInventaire = (req, res) => {
  const formattedToday = dayjs().format("YYYY-MM-DD");

  const getInventairesQuery = `
  SELECT *, ABS(DATEDIFF(Date, '${formattedToday}')) AS DaysDifference
  FROM Inventaires
  ORDER BY DaysDifference ASC, Date DESC
  LIMIT 1`;

  db.query(getInventairesQuery, (err, results) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (results.length === 0) {
      return res.status(404).json({ message: "No inventaire found" });
    } else {
      return res.status(200).json(results[0]);
    }
  });
};

exports.updateInventaire = (req, res) => {
  // Récupération de l'ID de la réservation à modifier ainsi que des nouvelles valeurs
  const { id, newDate, newIsDone } = req.body;

  // Validation des données reçues
  if (!(id && (newDate || newIsDone))) {
    return res.status(400).json({ message: "Missing data for update" });
  }

  // Construction de la requête SQL de mise à jour
  let updateQuery = `UPDATE Inventaires SET `;
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
      return res.status(404).json({ message: "Inventaire not found" });
    } else {
      return res
        .status(200)
        .json({ message: "Inventaire updated successfully" });
    }
  });
};

exports.deleteInventaire = (req, res) => {
  const { id } = req.body;

  if (!id) {
    return res.status(400).json({ message: "Inventaire ID is required" });
  }

  const deleteQuery = `DELETE FROM Inventaires WHERE ID = ?`;

  db.query(deleteQuery, [id], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Inventaire not found" });
    } else {
      return res
        .status(200)
        .json({ message: "Inventaire deleted successfully" });
    }
  });
};
