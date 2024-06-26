require("dotenv").config();
const db = require("../../config/db.js");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

// Inscription
exports.register = (req, res) => {
  const { prenom, nom, email, pwd } = req.body;
  if (!(email && pwd)) {
    return res
      .status(400)
      .json({ message: "Username and password are required" });
  }

  // Check if username matches the regex
  const emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
  if (!emailRegex.test(email)) {
    return res.status(400).json({ message: "Invalid email format" });
  }

  // Check if password matches the regex
  const pwdRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%]).{8,24}$/;
  if (!pwdRegex.test(pwd)) {
    return res.status(400).json({ message: "Invalid password format" });
  }

  // Check if email already exists
  const checkEmailQuery = "SELECT * FROM Utilisateurs WHERE Email = ?";
  db.query(checkEmailQuery, [email], async (err, result) => {
    if (err) throw err;

    if (result.length > 0) {
      return res.status(409).json({ message: "Email already taken" });
    } else {
      // Hash password
      const hashedPwd = await bcrypt.hash(pwd, 10);

      // Insert new user into database
      const insertUserQuery =
        "INSERT INTO Utilisateurs (Nom, Prenom, Email, MotDePasse, Role) VALUES (?, ?, ?, ?, 'Utilisateur')";
      db.query(
        insertUserQuery,
        [nom, prenom, email, hashedPwd],
        (err, result) => {
          if (err) throw err;
          res.status(201).json({ message: "User registered successfully" });
        }
      );
    }
  });
};

// Connexion
exports.login = (req, res) => {
  const { email, pwd } = req.body;

  if (!(email && pwd)) {
    return res.status(400).json({ message: "Email and password are required" });
  }

  const findUserQuery = "SELECT * FROM Utilisateurs WHERE Email = ?";
  db.query(findUserQuery, [email], async (err, result) => {
    if (err) throw err;

    if (result.length > 0) {
      const user = result[0];

      const isMatch = await bcrypt.compare(pwd, user.MotDePasse);
      if (isMatch) {
        // Ici, vous générez le token d'accès. Vous pouvez aussi inclure d'autres données utilisateur selon les besoins.
        const accessToken = jwt.sign(
          { userId: user.Id, email: user.Email, roles: user.Role }, // Assurez-vous que les rôles sont stockés dans votre DB et récupérés correctement
          process.env.ACCESS_TOKEN_SECRET,
          { expiresIn: "10s" } // Le token expire après 1 heure
        );

        const refreshToken = jwt.sign(
          { userId: user.Id, email: user.Email, roles: user.Role },
          process.env.REFRESH_TOKEN_SECRET,
          { expiresIn: "7d" } // Le refreshToken expire après 7 jours, par exemple
        );

        const updateRefreshTokenQuery =
          "UPDATE Utilisateurs SET refreshToken = ? WHERE Email = ?";
        db.query(
          updateRefreshTokenQuery,
          [refreshToken, user.Email],
          (err, result) => {
            if (err) {
              console.error(err);
              return res.sendStatus(500); // Internal Server Error
            }

            // Envoyez le refreshToken au client sous forme de cookie HttpOnly
            res.cookie("jwt", refreshToken, {
              httpOnly: true,
              secure: true,
              sameSite: "None",
              maxAge: 24 * 60 * 60 * 1000,
            }); // 1 jour en millisecondes

            res.status(200).json({
              accessToken,
              roles: user.Role,
              prenom: user.Prenom,
              nom: user.Nom,
            });
          }
        );
      } else {
        res.status(401).json({ message: "Invalid email or password" });
      }
    } else {
      res.status(404).json({ message: "User not found" });
    }
  });
};
