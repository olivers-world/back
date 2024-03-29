const express = require("express");
const router = express.Router();
const reservationController = require("../controllers/reservationController");

// Route pour créer une réservation
router.post("/create", reservationController.createReservation);
// Route pour obtenir les réservations
router.get("/get", reservationController.getReservation);
// Nouvelle route pour mettre à jour une réservation
router.put("/update", reservationController.updateReservation);
// Nouvelle route pour supprimer une réservation
router.delete("/delete", reservationController.deleteReservation);

module.exports = router;
