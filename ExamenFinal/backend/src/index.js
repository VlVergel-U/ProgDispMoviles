import server from "./app.js";
import { sequelize } from "./services/pq_sequelize.js";
import { createUser } from "./libs/init.js";

async function main() {
  try {
    await sequelize.sync({ force: false });
    createUser();
    server.listen(3000, () => {
      console.log("Server listen on port", 3000);
    });
  } catch (error) {
    console.log("Unable to connect to the datatabase", error);
  }
}
main();