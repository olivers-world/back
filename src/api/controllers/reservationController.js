require("dotenv").config();
const db = require("../../config/db.js");
const moment = require("moment-timezone");

const maxPeople = 52;

Date.prototype.addHours = function (h) {
  this.setTime(this.getTime() + h * 60 * 60 * 1000);
  return this;
};

exports.createReservation = (req, res) => {
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

exports.getReservation = (req, res) => {
  // Récupérez la date et l'heure de la requête GET
  const { from, to } = req.query;
  console.log("from : " + from);
  console.log("to : " + to);

  // Valider les données reçues
  if (!from || !to) {
    return res
      .status(400)
      .json({ message: "From date and To date are required" });
  }

  // Vérifiez si 'from' et 'to' sont des dates valides
  const fromDate = Date.parse(from);
  const toDate = Date.parse(to);

  if (isNaN(fromDate) || isNaN(toDate)) {
    return res
      .status(400)
      .json({
        message: "Invalid date format. Please use a valid date format.",
      });
  }

  // Créer une date de début et de fin basées sur l'heure reçue
  const fromTime = new Date(from + "Z");
  const toTime = new Date(to + "Z");

  console.log("fromTime : " + fromTime);
  console.log("toTime : " + toTime);

  const startOfHour = new Date(fromTime.setMinutes(0, 0, 0));
  const endOfHour = new Date(toTime.setMinutes(0, 0, 0));

  console.log("startOfHour : " + startOfHour);
  console.log("endOfHour : " + endOfHour);

  // Formater pour SQL
  const startDateFormat = startOfHour
    .toISOString()
    .slice(0, 19)
    .replace("T", " ");
  const endDateFormat = endOfHour
    .toISOString()
    .slice(0, 19)
    .replace("T", " ");

  console.log(startDateFormat);
  console.log(endDateFormat);

  // Requête SQL pour récupérer les réservations pour l'heure donnée
  const getReservationsQuery = `
    SELECT * FROM Reservations
    WHERE DateHeure BETWEEN ? AND ?
    AND Statut = 'Prise'
  `;

  // Exécution de la requête SQL pour récupérer les réservations
  db.query(
    getReservationsQuery,
    [startDateFormat, endDateFormat],
    (err, results) => {
      if (err) {
        // Gérer les erreurs de la base de données ici
        return res.status(500).json({ message: "Database error", error: err });
      } else {
        console.log(results);
        return res.status(200).json(results);
      }
    }
  );
};

exports.updateReservation = (req, res) => {
  // Récupération de l'ID de la réservation à modifier ainsi que des nouvelles valeurs
  const { reservationId, newNom, newDate, newNbPersonne } = req.body;

  // Validation des données reçues
  if (!(reservationId && (newDate || newNbPersonne || newNom))) {
    return res.status(400).json({ message: "Missing data for update" });
  }

  // Construction de la requête SQL de mise à jour
  let updateQuery = `UPDATE Reservations SET `;
  const queryParams = [];

  if (newNom) {
    updateQuery += `Nom = ?, `;
    queryParams.push(newNom);
  }

  if (newDate) {
    updateQuery += `DateHeure = ?, `;
    queryParams.push(newDate);
  }

  if (newNbPersonne) {
    updateQuery += `NbPersonnes = ?, `;
    queryParams.push(newNbPersonne);
  }

  updateQuery = updateQuery.slice(0, -2); // Enlever la dernière virgule et espace
  updateQuery += ` WHERE ID = ?`;
  queryParams.push(reservationId);

  // Exécution de la requête SQL pour mettre à jour la réservation
  db.query(updateQuery, queryParams, (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Reservation not found" });
    } else {
      return res
        .status(200)
        .json({ message: "Reservation updated successfully" });
    }
  });
};

exports.deleteReservation = (req, res) => {
  // Récupération de l'ID de la réservation à supprimer
  const { reservationId } = req.body;

  // Valider les données reçues
  if (!reservationId) {
    return res.status(400).json({ message: "Reservation ID is required" });
  }

  // Construction de la requête SQL de suppression
  const deleteQuery = `DELETE FROM Reservations WHERE ID = ?`;

  // Exécution de la requête SQL pour supprimer la réservation
  db.query(deleteQuery, [reservationId], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Reservation not found" });
    } else {
      return res
        .status(200)
        .json({ message: "Reservation deleted successfully" });
    }
  });
};
