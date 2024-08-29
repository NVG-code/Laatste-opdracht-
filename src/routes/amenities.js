import express from "express";
import { PrismaClient } from "@prisma/client";

const router = express.Router();
const prisma = new PrismaClient();

// GET all amenities
router.get("/", async (req, res) => {
  const amenities = await prisma.amenity.findMany();
  res.json(amenities);
});

// POST create new amenity
router.post("/", async (req, res) => {
  const amenity = await prisma.amenity.create({
    data: req.body,
  });
  res.status(201).json(amenity);
});

// GET single amenity by ID
router.get("/:id", async (req, res) => {
  const amenity = await prisma.amenity.findUnique({
    where: { id: parseInt(req.params.id) },
  });
  if (amenity) {
    res.json(amenity);
  } else {
    res.status(404).json({ error: "Amenity not found" });
  }
});

// PUT update amenity by ID
router.put("/:id", async (req, res) => {
  const amenity = await prisma.amenity.update({
    where: { id: parseInt(req.params.id) },
    data: req.body,
  });
  res.json(amenity);
});

// DELETE remove amenity by ID
router.delete("/:id", async (req, res) => {
  await prisma.amenity.delete({
    where: { id: parseInt(req.params.id) },
  });
  res.status(204).end();
});

export default router;
