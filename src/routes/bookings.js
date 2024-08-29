import express from "express";
import { PrismaClient } from "@prisma/client";

const router = express.Router();
const prisma = new PrismaClient();

// GET all bookings
router.get("/", async (req, res) => {
  const bookings = await prisma.booking.findMany();
  res.json(bookings);
});

// POST create new booking
router.post("/", async (req, res) => {
  const booking = await prisma.booking.create({
    data: req.body,
  });
  res.status(201).json(booking);
});

// GET single booking by ID
router.get("/:id", async (req, res) => {
  const booking = await prisma.booking.findUnique({
    where: { id: parseInt(req.params.id) },
  });
  if (booking) {
    res.json(booking);
  } else {
    res.status(404).json({ error: "Booking not found" });
  }
});

// PUT update booking by ID
router.put("/:id", async (req, res) => {
  const booking = await prisma.booking.update({
    where: { id: parseInt(req.params.id) },
    data: req.body,
  });
  res.json(booking);
});

// DELETE remove booking by ID
router.delete("/:id", async (req, res) => {
  await prisma.booking.delete({
    where: { id: parseInt(req.params.id) },
  });
  res.status(204).end();
});

export default router;
