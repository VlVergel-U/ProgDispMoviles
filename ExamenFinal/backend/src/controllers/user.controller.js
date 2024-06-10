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

export const getUser = async (req, res) => {

  const { username } = req.params;

  try {
         const searchUser = await song.findOne({
              where: { username },
          });

      if (!searchUser) {
          return res.status(404).json({ message: "Usuario no encontrado" });
      }
      res.json(searchUser);

  } catch (error) {
      return res.status(500).json({ message: error.message });
  }

};