const express = require("express");
const router = express.Router();
const reservationController = require("../controllers/reservationController");

// Définition des routes d'authentification
router.post("/reservation", reservationController.createReservation);

module.exports = router;
