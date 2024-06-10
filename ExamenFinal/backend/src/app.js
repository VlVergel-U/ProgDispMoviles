import express from "express";
import cors from "cors";
import userRoutes from "./routes/user.routes.js";
import songRoutes from "./routes/song.routes.js";


const server = express();

server.use(express.json());
server.use(
  cors({
    origin: "http://localhost:56227",
  })
);

server.use(userRoutes);
server.use(songRoutes);


export default server;