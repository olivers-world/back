const express = require("express");
const router = express.Router();
const inventaireController = require("../controllers/inventaireController");

router.post("/create", inventaireController.createInventaire);
router.get("/get", inventaireController.getMostRecentInventaire);
router.put("/update", inventaireController.updateInventaire);
router.delete("/delete", inventaireController.deleteInventaire);

module.exports = router;
