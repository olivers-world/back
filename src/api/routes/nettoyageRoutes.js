const express = require("express");
const router = express.Router();
const nettoyageController = require("../controllers/nettoyageController");

router.post("/create", nettoyageController.createNettoyage);
router.get("/get", nettoyageController.getMostRecentNettoyage);
router.put("/update", nettoyageController.updateNettoyage);
router.delete("/delete", nettoyageController.deleteNettoyage);

module.exports = router;
