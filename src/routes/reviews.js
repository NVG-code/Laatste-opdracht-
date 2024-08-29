import express from "express";
import { PrismaClient } from "@prisma/client";

const router = express.Router();
const prisma = new PrismaClient();

// GET all reviews
router.get("/", async (req, res) => {
  const reviews = await prisma.review.findMany();
  res.json(reviews);
});

// POST create new review
router.post("/", async (req, res) => {
  const review = await prisma.review.create({
    data: req.body,
  });
  res.status(201).json(review);
});

// GET single review by ID
router.get("/:id", async (req, res) => {
  const review = await prisma.review.findUnique({
    where: { id: parseInt(req.params.id) },
  });
  if (review) {
    res.json(review);
  } else {
    res.status(404).json({ error: "Review not found" });
  }
});

// PUT update review by ID
router.put("/:id", async (req, res) => {
  const review = await prisma.review.update({
    where: { id: parseInt(req.params.id) },
    data: req.body,
  });
  res.json(review);
});

// DELETE remove review by ID
router.delete("/:id", async (req, res) => {
  await prisma.review.delete({
    where: { id: parseInt(req.params.id) },
  });
  res.status(204).end();
});

export default router;
