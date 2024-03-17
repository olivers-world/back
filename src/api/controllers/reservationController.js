require("dotenv").config();
const db = require("../../config/db.js");

exports.createReservation = (req, res) => {
  // Ici, vous récupérez les données envoyées avec la requête POST.
  const { user, date, nbPersonne } = req.body;

  // Valider les données reçues
  if (!(user && date && nbPersonne)) {
    return res.status(400).json({ message: "User, date, and number of people are required" });
  }

  // Une requête SQL pour insérer la nouvelle réservation dans la base de données.
  const createReservationQuery = `
    INSERT INTO Reservations (Utilisateur, DateHeure, NbPersonnes)
    VALUES (?, ?, ?)
  `;

  // Exécution de la requête SQL
  db.query(createReservationQuery, [user, date, nbPersonne], (err, result) => {
    if (err) {
      // Gérer les erreurs de la base de données ici
      res.status(500).json({ message: "Database error", error: err });
    } else {
      // Réussite de l'insertion
      res.status(201).json({ message: "Reservation created successfully", reservationId: result.insertId });
    }
  });
};
