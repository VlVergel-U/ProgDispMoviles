import { Router } from "express";
import { getSong, getSongs } from "../controllers/song.controller.js";

const router = Router();

router.get("/getSong/:name", getSong);
router.get("/getSongs", getSongs);

export default router;