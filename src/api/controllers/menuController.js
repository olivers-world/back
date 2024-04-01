require("dotenv").config();
const db = require("../../config/db.js");

exports.createMenu = (req, res) => {
  const { menu, prix } = req.body;

  if (!(menu && prix)) {
    return res.status(400).json({ message: "Menu and prix are required" });
  }

  const createMenuQuery = `
    INSERT INTO Menus (Menu, Prix)
    VALUES (?, ?)
  `;

  db.query(createMenuQuery, [menu, prix], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else {
      return res.status(201).json({
        message: "Menu created successfully",
      });
    }
  });
};

exports.getMenusWithPlats = (req, res) => {
  const getMenusWithPlatsQuery = `
    SELECT Menus.Menu, Menus.Prix, Plats.Nom AS Plat, Plats.Prix AS PlatPrix, Plats.Types
    FROM Menus
    INNER JOIN MenusPlats ON Menus.Menu = MenusPlats.Menu
    INNER JOIN Plats ON MenusPlats.Plat = Plats.Nom
  `;

  db.query(getMenusWithPlatsQuery, (err, results) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else {
      // Group by menu
      const menus = {};
      results.forEach((row) => {
        if (!menus[row.Menu]) {
          menus[row.Menu] = {
            Menu: row.Menu,
            Prix: row.Prix,
            Plats: [],
          };
        }
        menus[row.Menu].Plats.push({
          Nom: row.Plat,
          Prix: row.PlatPrix,
          Types: row.Types,
        });
      });
      return res.status(200).json(Object.values(menus));
    }
  });
};

exports.updateMenu = (req, res) => {
  const { menu, newMenu, newPrix } = req.body;

  if (!(menu && (newMenu || newPrix))) {
    return res.status(400).json({ message: "Missing data for update" });
  }

  let updateQuery = `UPDATE Menus SET `;
  const queryParams = [];

  if (newMenu) {
    updateQuery += `Menu = ?, `;
    queryParams.push(newMenu);
  }
  if (newPrix) {
    updateQuery += `Prix = ?, `;
    queryParams.push(newPrix);
  }

  updateQuery = updateQuery.slice(0, -2); // Removes the trailing comma and space
  updateQuery += ` WHERE Menu = ?`;
  queryParams.push(menu);

  db.query(updateQuery, queryParams, (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Menu not found" });
    } else {
      return res.status(200).json({ message: "Menu updated successfully" });
    }
  });
};

exports.deleteMenu = (req, res) => {
  const { menu } = req.body;

  if (!menu) {
    return res.status(400).json({ message: "Menu identifier is required" });
  }

  const deleteMenuQuery = `DELETE FROM Menus WHERE Menu = ?`;

  db.query(deleteMenuQuery, [menu], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Menu not found" });
    } else {
      return res.status(200).json({ message: "Menu deleted successfully" });
    }
  });
};
