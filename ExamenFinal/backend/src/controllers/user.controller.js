import { user } from "../models/user.model.js";

export const login = async (req, res) => {
  const { username, password} = req.body;
  try {
    const searchUser = await user.findOne({ where: { username, password } });

    if (searchUser) {
      res.status(200).json({ message: "Usuario autenticado" });
    } else {
      res.status(401).json({ error: "Credenciales incorrectas" });
    }
  } catch (error) {
    console.error("Error al autenticar usuario:", error);
    res.status(500).send("Error interno del servidor");
  }
};