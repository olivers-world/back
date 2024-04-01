require("dotenv").config();
const db = require("../../config/db.js");
const dayjs = require('dayjs');

exports.createFormuleDuJour = (req, res) => {
  const { menu, date } = req.body;

  if (!menu) {
    return res.status(400).json({ message: "Menu identifier is required" });
  }

  const formattedDate = date ? dayjs(date).format('YYYY-MM-DD') : dayjs().format('YYYY-MM-DD');

  const createFormuleDuJourQuery = `
    INSERT INTO FormuleDuJour (Menu, Date)
    VALUES (?, ?)
  `;

  db.query(createFormuleDuJourQuery, [menu, formattedDate], (err, result) => {
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
    SELECT Menus.Menu, Menus.Prix, Plats.Nom AS Plat, Plats.Prix AS PlatPrix, Plats.Types
    FROM FormuleDuJour
    INNER JOIN Menus ON FormuleDuJour.Menu = Menus.Menu
    INNER JOIN MenusPlats ON Menus.Menu = MenusPlats.Menu
    INNER JOIN Plats ON MenusPlats.Plat = Plats.Nom
    WHERE FormuleDuJour.Date = ?
  `;

  db.query(getFormuleDuJourQuery, [today], (err, results) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else {
      if (results.length === 0) {
        return res.status(404).json({ message: "No Formule du Jour for today" });
      }
      const menu = {
        Menu: results[0].Menu,
        Prix: results[0].Prix,
        Plats: results.map(({ Plat, PlatPrix, Types }) => ({
          Nom: Plat,
          Prix: PlatPrix,
          Types
        }))
      };
      return res.status(200).json(menu);
    }
  });
};


exports.updateFormuleDuJour = (req, res) => {
  const { menu, newMenu, newDate } = req.body;
  const today = dayjs().format('YYYY-MM-DD');

  if (!(menu && (newMenu || newDate))) {
    return res.status(400).json({ message: "Missing data for update" });
  }

  let updateQuery = `UPDATE FormuleDuJour SET `;
  const queryParams = [];

  if (newMenu) {
    updateQuery += `Menu = ?, `;
    queryParams.push(newMenu);
  }
  if (newDate) {
    const formattedNewDate = dayjs(newDate).format('YYYY-MM-DD');
    updateQuery += `Date = ?, `;
    queryParams.push(formattedNewDate);
  }

  updateQuery = updateQuery.slice(0, -2); // Removes the trailing comma and space
  updateQuery += ` WHERE Menu = ? AND Date = ?`;
  queryParams.push(menu, today);

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
  const { menu } = req.body;
  const today = dayjs().format('YYYY-MM-DD');

  if (!menu) {
    return res.status(400).json({ message: "Menu identifier is required for deletion" });
  }

  const deleteFormuleDuJourQuery = `DELETE FROM FormuleDuJour WHERE Menu = ? AND Date = ?`;

  db.query(deleteFormuleDuJourQuery, [menu, today], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    } else if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Formule du Jour not found" });
    } else {
      return res.status(200).json({ message: "Formule du Jour deleted successfully" });
    }
  });
};