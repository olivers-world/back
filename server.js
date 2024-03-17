const express = require("express");
const cors = require("cors");
require("dotenv").config();

const authRoutes = require("./src/api/routes/authRoutes");
const reservationRoutes = require("./src/api/routes/reservationRoutes.js");

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

app.listen(port, () => {
  console.log(`Server started on http://localhost:${port}`);
});
