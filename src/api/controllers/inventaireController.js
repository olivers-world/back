require("dotenv").config();
const db = require("../../config/db.js");

exports.createInventaire = (req, res) => {
  // Ici, vous récupérez les données envoyées avec la requête POST.
  const { email, nom, date, nbPersonne } = req.body;

  // Valider les données reçues
  if (!(email && nom && date && nbPersonne)) {
    return res
      .status(400)
      .json({ message: "Email, nom, date, and number of people are required" });
  }

  // Vérifier s'il y a assez de place pour la nouvelle réservation
  const checkAvailabilityQuery = `
    SELECT SUM(NbPersonnes) as TotalPersonnes
    FROM Reservations
    WHERE DateHeure BETWEEN ? AND DATE_ADD(?, INTERVAL 1 DAY)
    AND (Statut = 'Prise' OR Statut = 'En cours')
  `;

  db.query(checkAvailabilityQuery, [date, date], (err, result) => {
    if (err) {
      // Gérer les erreurs de la base de données ici
      return res.status(500).json({ message: "Database error", error: err });
    }

    const totalReserved = result[0].TotalPersonnes || 0;

    if (parseInt(totalReserved, 10) + parseInt(nbPersonne, 10) > maxPeople) {
      // Si on dépasse la capacité max, on refuse la réservation
      return res.status(400).json({
        message: "Pas assez de place",
      });
    } else {
      // Il y a assez de place, on peut insérer la nouvelle réservation
      const createReservationQuery = `
        INSERT INTO Reservations (Email, Nom, DateHeure, NbPersonnes, Statut)
        VALUES (?, ?, ?, ?, 'Prise')
      `;

      // Exécution de la requête SQL pour créer la réservation
      db.query(
        createReservationQuery,
        [email, nom, date, nbPersonne],
        (err, result) => {
          if (err) {
            // Gérer les erreurs de la base de données ici
            return res
              .status(500)
              .json({ message: "Database error", error: err });
          } else {
            // Réussite de l'insertion
            return res.status(201).json({
              message: "Reservation creer avec succes",
              reservationId: result.insertId,
            });
          }
        }
      );
    }
  });
};

exports.getMostRecentInventaire = (req, res) => {
  const getInventairesQuery = `SELECT * FROM Inventaire ORDER BY Date DESC LIMIT 1`;

  db.query(getInventairesQuery, (err, results) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
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
  let updateQuery = `UPDATE Inventaire SET `;
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

  const deleteQuery = `DELETE FROM Inventaire WHERE ID = ?`;  

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
