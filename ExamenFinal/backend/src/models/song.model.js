import { DataTypes } from "sequelize";
import { sequelize } from "../services/pq_sequelize.js";


export const song = sequelize.define(
    "song",
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      name: {
        type: DataTypes.STRING,
        unique: false,
        validate: {
          notEmpty: {
            msg: "El nombre de la canción no puede estar vacío"
          },
          len: {
            args: [1, 50],
            msg: "El nombre de la canción debe tener entre 1 y 50 caracteres"
          }
        }
      },
      img: {
        type: DataTypes.STRING,
        unique: false,
        validate: {
          notEmpty: {
            msg: "La URL de la imagen no puede estar vacía"
          },
          isUrl: {
            msg: "La URL de la imagen no es válida"
          }
        }
      },
    },
    {
      timestamps: false,
    }
);
