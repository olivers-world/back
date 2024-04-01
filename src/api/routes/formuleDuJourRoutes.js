const express = require("express");
const router = express.Router();
const formuleDuJourController = require("../controllers/formuleDuJourController");

router.post("/create", formuleDuJourController.createFormuleDuJour);
router.get("/get", formuleDuJourController.getFormuleDuJour);
router.put("/update", formuleDuJourController.updateFormuleDuJour);
router.delete("/delete", formuleDuJourController.deleteFormuleDuJour);

module.exports = router;
