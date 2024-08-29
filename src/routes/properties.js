import express from "express";
import { PrismaClient } from "@prisma/client";

const router = express.Router();
const prisma = new PrismaClient();

// GET all properties
router.get("/", async (req, res) => {
  const properties = await prisma.property.findMany();
  res.json(properties);
});

// POST create new property
router.post("/", async (req, res) => {
  const property = await prisma.property.create({
    data: req.body,
  });
  res.status(201).json(property);
});

// GET single property by ID
router.get("/:id", async (req, res) => {
  const property = await prisma.property.findUnique({
    where: { id: parseInt(req.params.id) },
  });
  if (property) {
    res.json(property);
  } else {
    res.status(404).json({ error: "Property not found" });
  }
});

// PUT update property by ID
router.put("/:id", async (req, res) => {
  const property = await prisma.property.update({
    where: { id: parseInt(req.params.id) },
    data: req.body,
  });
  res.json(property);
});

// DELETE remove property by ID
router.delete("/:id", async (req, res) => {
  await prisma.property.delete({
    where: { id: parseInt(req.params.id) },
  });
  res.status(204).end();
});

export default router;
