import { user } from "../models/user.model.js";

export const createUser = async () => {
  try {
    const userFound = await user.findOne();
    if (userFound) return;

    const newUser = await user.create({
      username: "user",
      password: "2020",
    });

    console.log("User ready");
  } catch (error) {
    console.error(error);
  }
};