const db = require("../../config/db.js"); // Assurez-vous que c'est le chemin correct vers votre configuration de base de données
const jwt = require("jsonwebtoken");

exports.handleLogout = async (req, res) => {
  // Côté client, vous devez également supprimer le accessToken
  const cookies = req.cookies;
  console.log(cookies);
  
  if (!cookies?.jwt) return res.sendStatus(204); // No content, le refreshToken n'est pas présent
  const refreshToken = cookies.jwt;

  // Vérifiez d'abord le refreshToken
  jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET, (err, decoded) => {
    if (err) {
      // Si le refreshToken n'est pas valide ou expiré, supprimez simplement le cookie
      res.clearCookie("jwt", {
        httpOnly: true,
        sameSite: "None",
        secure: true,
      });
      return res.sendStatus(204); // No content
    }

    // Est-ce que le refreshToken est dans la base de données?
    const findUserQuery = "SELECT * FROM Utilisateurs WHERE refreshToken = ?";
    db.query(findUserQuery, [refreshToken], (err, users) => {
      if (err) {
        console.error(err);
        return res.sendStatus(500); // Erreur serveur interne
      }

      if (users.length === 0) {
        // Pas d'utilisateur trouvé avec ce refreshToken, peut-être qu'il a déjà été effacé
        res.clearCookie("jwt", {
          httpOnly: true,
          sameSite: "None",
          secure: true,
        });
        return res.sendStatus(204); // No content
      } else {
        // Effacez le refreshToken dans la base de données
        const updateUserQuery =
          "UPDATE Utilisateurs SET refreshToken = NULL WHERE refreshToken = ?";
        db.query(updateUserQuery, [refreshToken], (err, result) => {
          if (err) {
            console.error(err);
            return res.sendStatus(500); // Erreur serveur interne
          }

          // Log de résultat pour le débogage, peut être retiré en production
          console.log(result);

          // Supprimez le cookie contenant le refreshToken
          res.clearCookie("jwt", {
            httpOnly: true,
            sameSite: "None",
            secure: true,
          });
          res.sendStatus(204); // No content
        });
      }
    });
  });
};
