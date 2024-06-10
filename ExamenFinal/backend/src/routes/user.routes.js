import { Router } from "express";
import { login, getUser } from "../controllers/user.controller.js";

const router = Router();

router.post("/login", login);
router.get("/getUser/:id", getUser);

export default router;