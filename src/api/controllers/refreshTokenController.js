const jwt = require('jsonwebtoken');
const db = require('../../config/db.js'); // Assuming the path to your db module is correct

exports.handleRefreshToken = async (req, res) => {
    const cookies = req.cookies;
    if (!cookies?.jwt) return res.sendStatus(401);
    const refreshToken = cookies.jwt;

    // Replace the Mongoose call with an SQL query to find the user by refreshToken
    const findUserQuery = "SELECT * FROM Utilisateurs WHERE refreshToken = ?";
    db.query(findUserQuery, [refreshToken], (err, users) => {
        if (err) {
            console.error(err);
            return res.sendStatus(500); // Internal Server Error
        }
        if (users.length === 0) return res.sendStatus(403); // Forbidden

        const foundUser = users[0]; // Assuming the refreshToken is unique and only one user should be returned

        // evaluate jwt
        jwt.verify(
            refreshToken,
            process.env.REFRESH_TOKEN_SECRET,
            (err, decoded) => {
                if (err || foundUser.Email !== decoded.email) return res.sendStatus(403); // Found user's email should match the one in token

                // You may need to adjust this if your roles are stored differently
                const roles = foundUser.Role; // Assuming roles is a string. If it's more complex, adjust accordingly.

                const accessToken = jwt.sign(
                    {
                        "UserInfo": {
                            "email": decoded.email,
                            "roles": roles // Adjust based on how roles are stored and expected to be used
                        }
                    },
                    process.env.ACCESS_TOKEN_SECRET,
                    { expiresIn: '1h' }
                );
                res.json({ roles, accessToken })
            }
        );
    });
}