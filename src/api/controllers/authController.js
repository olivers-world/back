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
        "INSERT INTO Utilisateurs (Nom, Prenom, Email, MotDePasse) VALUES (?, ?, ?, ?)";
      db.query(insertUserQuery, [prenom, nom, user, hashedPwd], (err, result) => {
        if (err) throw err;
        res.status(201).json({ message: "User registered successfully" });
      });
    }
  });
};

// Connexion
exports.login = (req, res) => {
  // Implémentation de la connexion
};
