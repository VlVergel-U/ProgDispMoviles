import express from "express";
import cors from "cors";
import userRoutes from "./routes/user.routes.js";
import songRoutes from "./routes/song.routes.js";


const server = express();

server.use(express.json());
server.use(cors());
server.use(userRoutes);
server.use(songRoutes);


export default server;