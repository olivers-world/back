const db = require("../../config/db.js");
const { Resend } = require("resend");

// Initialisez l'instance de Resend avec votre clé d'API
const resendClient = new Resend('YOUR_API_KEY');

exports.sendEmail = async (req, res) => {
  const { emailFrom, emailTo, emailSubject, emailContent } = req.body;

  try {
    // Utilisation de resend pour envoyer l'e-mail
    const { data, error } = await resendClient.emails.send({
      from: emailFrom, // Adresse e-mail de l'expéditeur
      to: emailTo, // Adresse e-mail du destinataire
      subject: emailSubject, // Sujet de l'e-mail
      html: emailContent // Contenu HTML de l'e-mail
    });

    if (error) {
      console.error("Erreur lors de l'envoi de l'e-mail :", error);
      return res.status(500).json({ error: "Erreur lors de l'envoi de l'e-mail" });
    }

    // L'e-mail a été envoyé avec succès
    res.status(200).json({ message: "E-mail envoyé avec succès", data });
  } catch (error) {
    console.error("Erreur lors de l'envoi de l'e-mail :", error);
    res.status(500).json({ error: "Erreur lors de l'envoi de l'e-mail" });
  }
};
