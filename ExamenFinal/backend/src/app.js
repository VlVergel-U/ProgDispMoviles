import express from "express";
import cors from "cors";
import userRoutes from "./routes/user.routes.js";

const server = express();

server.use(express.json());
server.use(
  cors({
    origin: "http://localhost:56227",
  })
);

server.use(userRoutes);


export default server;