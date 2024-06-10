import { Router } from "express";
import { getSong, getSongs } from "../controllers/song.controller.js";

const router = Router();

router.get("/getSong/:id", getSong);
router.get("/getSongs", getSongs);

export default router;