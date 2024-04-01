const express = require("express");
const cors = require("cors");
require("dotenv").config();

const authRoutes = require("./src/api/routes/authRoutes");
const reservationRoutes = require("./src/api/routes/reservationRoutes.js");
const inventaireRoutes = require("./src/api/routes/inventaireRoutes.js");
const platRoutes = require("./src/api/routes/platRoutes.js");
const menuRoutes = require("./src/api/routes/menuRoutes.js");
const nettoyageRoutes = require("./src/api/routes/nettoyageRoutes.js");
const logoutRoutes = require("./src/api/routes/logoutRoutes.js");
const refreshRoutes = require("./src/api/routes/refreshRoutes.js");
const formuleDuJourRoutes = require("./src/api/routes/formuleDuJourRoutes.js");

const app = express();
const port = process.env.PORT;

const corsOptions = {
  origin: "http://localhost:5173", // Remplacez ceci par l'URL d'origine de votre client
  credentials: true, // Autorisation des credentials
};

app.use(cors(corsOptions));
app.use(express.json());

// Utilisation des routes d'authentification
app.use("/api/auth", authRoutes);
app.use("/api/reservation", reservationRoutes);
app.use("/api/plat", platRoutes);
app.use("/api/menu", menuRoutes);
app.use("/api/formuleDuJour", formuleDuJourRoutes);
app.use("/api/inventaire", inventaireRoutes);
app.use("/api/nettoyage", nettoyageRoutes);
app.use("/api/logout", logoutRoutes);
app.use("/api/refresh", refreshRoutes);

app.listen(port, () => {
  console.log(`Server started on http://localhost:${port}`);
});
