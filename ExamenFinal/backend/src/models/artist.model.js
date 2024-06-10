import { DataTypes } from "sequelize";
import { sequelize } from "../services/pq_sequelize.js";
import { song } from "./song.model.js";

export const artist = sequelize.define(

    "artist",
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
            msg: "El nombre del artista no puede estar vacío"
          },
          len: {
            args: [1, 50],
            msg: "El nombre del artista debe tener entre 1 y 50 caracteres"
          }
        }
      }
    },
    {
      timestamps: false,
    }
    
);

  artist.hasMany(song, {
    foreignKey: "artistId",
    sourceKey: "id",
  });
  song.belongsTo(artist, {
    foreignKey: "artistId",
    targetId: "id",
  });
