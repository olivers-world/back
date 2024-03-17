const express = require("express");
const router = express.Router();
const reservationController = require("../controllers/reservationController");

// Définition des routes d'authentification
router.post("/create", reservationController.createReservation);
router.post("/get", reservationController.getReservation);

module.exports = router;