const express = require("express");
const router = express.Router();
const authController = require("../controllers/authController");

// Définition des routes d'authentification
router.post("/register", authController.register);
router.post("/login", authController.login);

module.exports = router;
