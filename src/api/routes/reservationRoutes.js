const express = require("express");
const router = express.Router();
const reservationController = require("../controllers/reservationController");

// Définition des routes d'authentification
router.post("/create", reservationController.createReservation);
router.get("/get", reservationController.getReservation);

module.exports = router;