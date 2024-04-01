require("dotenv").config();
const db = require("../../config/db.js");
const dayjs = require('dayjs');

exports.createFormuleDuJour = (req, res) => {
  const { menuID, date } = req.body; // Use menuID instead of menu

  if (!menuID) {
    return res.status(400).json({ message: "Menu ID is required" });
  }

  const formattedDate = date ? dayjs(date).format('YYYY-MM-DD') : dayjs().format('YYYY-MM-DD');

  const createFormuleDuJourQuery = `
    INSERT INTO FormuleDuJour (MenuID, Date)
    VALUES (?, ?)
  `; // Use MenuID column

  db.query(createFormuleDuJourQuery, [menuID, formattedDate], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else {
      return res.status(201).json({
        message: "Formule du Jour created successfully",
      });
    }
  });
};

exports.getFormuleDuJour = (req, res) => {
  const today = dayjs().format('YYYY-MM-DD');

  const getFormuleDuJourQuery = `
    SELECT Menus.ID, Menus.Menu, Menus.Prix, Plats.ID AS PlatID, Plats.Nom AS Plat, Plats.Prix AS PlatPrix, Plats.Types
    FROM FormuleDuJour
    INNER JOIN Menus ON FormuleDuJour.MenuID = Menus.ID
    INNER JOIN MenusPlats ON Menus.ID = MenusPlats.MenuID
    INNER JOIN Plats ON MenusPlats.PlatID = Plats.ID
    WHERE FormuleDuJour.Date = ?
  `; // Adjusted to work with ID relationships

  db.query(getFormuleDuJourQuery, [today], (err, results) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else {
      if (results.length === 0) {
        return res.status(404).json({ message: "No Formule du Jour for today" });
      }
      // Transform results to grouped by menu structure
      const menu = results.reduce((acc, cur) => {
        acc.Menu = cur.Menu;
        acc.Prix = cur.Prix;
        acc.Plats = acc.Plats || [];
        acc.Plats.push({
          ID: cur.PlatID,
          Nom: cur.Plat,
          Prix: cur.PlatPrix,
          Types: cur.Types
        });
        return acc;
      }, {});

      return res.status(200).json(menu);
    }
  });
};



exports.updateFormuleDuJour = (req, res) => {
  const { menuID, newMenuID, newDate } = req.body;
  const today = dayjs().format('YYYY-MM-DD');

  if (!(menuID && (newMenuID || newDate))) {
    return res.status(400).json({ message: "Missing data for update" });
  }

  let updateQuery = `UPDATE FormuleDuJour SET `;
  const queryParams = [];

  if (newMenuID) {
    updateQuery += `MenuID = ?, `;
    queryParams.push(newMenuID);
  }
  if (newDate) {
    const formattedNewDate = dayjs(newDate).format('YYYY-MM-DD');
    updateQuery += `Date = ?, `;
    queryParams.push(formattedNewDate);
  }

  updateQuery = updateQuery.slice(0, -2); // Removes the trailing comma and space
  updateQuery += ` WHERE MenuID = ? AND Date = ?`;
  queryParams.push(menuID, today);

  db.query(updateQuery, queryParams, (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Formule du Jour not found" });
    } else {
      return res.status(200).json({ message: "Formule du Jour updated successfully" });
    }
  });
};

exports.deleteFormuleDuJour = (req, res) => {
  const { menuID } = req.body;
  const today = dayjs().format('YYYY-MM-DD');

  if (!menuID) {
    return res.status(400).json({ message: "Menu ID is required for deletion" });
  }

  const deleteFormuleDuJourQuery = `DELETE FROM FormuleDuJour WHERE MenuID = ? AND Date = ?`;

  db.query(deleteFormuleDuJourQuery, [menuID, today], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Formule du Jour not found" });
    } else {
      return res.status(200).json({ message: "Formule du Jour deleted successfully" });
    }
  });
};
