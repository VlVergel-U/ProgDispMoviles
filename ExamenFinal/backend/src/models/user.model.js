import { DataTypes } from "sequelize";
import { sequelize } from "../services/pq_sequelize.js";

export const user = sequelize.define(
  "user",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    first_name: {
      type: DataTypes.STRING(),
      unique: false,
      allowNull: false,
      validate: {
        notEmpty: {
          msg: "El nombre no puede estar vacío"
        },
        len: [4, 20]
      },
    },
    second_name: {
      type: DataTypes.STRING(),
      unique: false,
      allowNull: false,
      defaultValue: '',
      validate: {
        len: [0, 20]
      },
    },
    
    first_last_name: {
      type: DataTypes.STRING(),
      unique: false,
      allowNull: false,
      validate: {
        notEmpty: {
          msg: "El primer apellido no puede estar vacío"
        },
        len: [4, 20]
      },
    },
    second_last_name: {
      type: DataTypes.STRING(),
      unique: false,
      allowNull: false,
      validate: {
        notEmpty: {
          msg: "El segundo apellido no puede estar vacío"
        },
        len: [4, 20]
      },
      
    },
    username: {
      type: DataTypes.STRING(),
      unique: true,
      allowNull: false,
      validate: {
        notEmpty: {
          msg: "El nombre de usuario no puede estar vacío"
        },
        len: [4, 20]
      },
    },
    password: {
      type: DataTypes.STRING(),
      allowNull: false,
      validate: {
        notEmpty: {
          msg: "La contraseña no puede estar vacía"
        },
        len: [4, 20]
      }
    },
  },
  {
    timestamps: false,
  }
);