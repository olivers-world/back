const express = require("express");
const router = express.Router();
const menuController = require("../controllers/menuController");

router.post("/create", menuController.createMenu);
router.get("/get", menuController.getMenusWithPlats);
router.put("/update", menuController.updateMenu);
router.delete("/delete", menuController.deleteMenu);

module.exports = router;
