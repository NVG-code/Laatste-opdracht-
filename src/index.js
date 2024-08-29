import express from "express";
import dotenv from "dotenv";
import routes from "./routes/routes.js";
import { errorHandler } from "./middleware/errorHandler.js";
import { logger } from "./middleware/logger.js";

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());
app.use(logger);
app.use("/api", routes);
app.use(errorHandler);

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
