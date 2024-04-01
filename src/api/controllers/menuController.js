require("dotenv").config();
const db = require("../../config/db.js");
const dayjs = require('dayjs');

exports.createMenu = (req, res) => {
  const { menu, prix, plats } = req.body;

  if (!(menu && prix && plats)) {
    return res.status(400).json({ message: "Menu, prix, and plats are required" });
  }

  const createMenuQuery = `
    INSERT INTO Menus (Menu, Prix)
    VALUES (?, ?)
  `;

  db.query(createMenuQuery, [menu, prix], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else {
      const menuId = result.insertId; // Récupérer l'ID du menu nouvellement créé

      // Insérer les associations plat-menu dans la table MenusPlats
      const insertPlatsQuery = `
        INSERT INTO MenusPlats (MenuID, PlatID) VALUES ?
      `;

      // Créer un tableau de valeurs pour l'insertion des associations plat-menu
      const values = plats.map(platId => [menuId, platId]);

      db.query(insertPlatsQuery, [values], (err, result) => {
        if (err) {
          return res.status(500).json({ message: "Database error", error: err });
        } else {
          return res.status(201).json({
            message: "Menu created successfully",
          });
        }
      });
    }
  });
};


exports.getMenusWithPlats = (req, res) => {
  const getMenusWithPlatsQuery = `
    SELECT Menus.ID, Menus.Menu, Menus.Prix, Plats.ID AS PlatID, Plats.Nom AS Plat, Plats.Prix AS PlatPrix, Plats.Types
    FROM Menus
    INNER JOIN MenusPlats ON Menus.ID = MenusPlats.MenuID
    INNER JOIN Plats ON MenusPlats.PlatID = Plats.ID
  `;

  db.query(getMenusWithPlatsQuery, (err, results) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else {
      const menus = {};
      results.forEach((row) => {
        if (!menus[row.ID]) {
          menus[row.ID] = {
            ID: row.ID,
            Menu: row.Menu,
            Prix: row.Prix,
            Plats: [],
          };
        }
        menus[row.ID].Plats.push({
          ID: row.PlatID,
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
  const { id, newMenu, newPrix } = req.body;

  if (!(id && (newMenu || newPrix))) {
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
  updateQuery += ` WHERE ID = ?`;
  queryParams.push(id);

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
  const { id } = req.body;

  if (!id) {
    return res.status(400).json({ message: "Menu ID is required" });
  }

  const deleteMenuQuery = `DELETE FROM Menus WHERE ID = ?`;

  db.query(deleteMenuQuery, [id], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Menu not found" });
    } else {
      return res.status(200).json({ message: "Menu deleted successfully" });
    }
  });
};