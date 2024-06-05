import { Sequelize } from "sequelize";
import "dotenv/config";

export const sequelize = new Sequelize(
  process.env.nameDatabase,
  process.env.userDatabase,
  process.env.passwordDataBase,
  {
    host: process.env.hostDatabase,
    dialect: "postgres",
  }
);