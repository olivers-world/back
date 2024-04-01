const express = require("express");
const router = express.Router();
const platController = require("../controllers/platController");

router.post("/create", platController.createPlats);
router.get("/get", platController.getPlats);
router.get("/getByTypes", platController.getPlatsByTypes);
router.put("/update", platController.updatePlats);
router.delete("/delete", platController.deletePlats);

module.exports = router;
