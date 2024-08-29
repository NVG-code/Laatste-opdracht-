import express from "express";
import usersRouter from "./users.js";
import hostsRouter from "./hosts.js";
import propertiesRouter from "./properties.js";
import amenitiesRouter from "./amenities.js";
import bookingsRouter from "./bookings.js";
import reviewsRouter from "./reviews.js";

const router = express.Router();

router.use("/users", usersRouter);
router.use("/hosts", hostsRouter);
router.use("/properties", propertiesRouter);
router.use("/amenities", amenitiesRouter);
router.use("/bookings", bookingsRouter);
router.use("/reviews", reviewsRouter);

export default router;
