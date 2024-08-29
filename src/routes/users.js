import express from "express";
import { PrismaClient } from "@prisma/client";

const router = express.Router();
const prisma = new PrismaClient();

// GET all users
router.get("/", async (req, res) => {
  const users = await prisma.user.findMany();
  res.json(users);
});

// POST create new user
router.post("/", async (req, res) => {
  const user = await prisma.user.create({
    data: req.body,
  });
  res.status(201).json(user);
});

// GET single user by ID
router.get("/:id", async (req, res) => {
  const user = await prisma.user.findUnique({
    where: { id: parseInt(req.params.id) },
  });
  if (user) {
    res.json(user);
  } else {
    res.status(404).json({ error: "User not found" });
  }
});

// PUT update user by ID
router.put("/:id", async (req, res) => {
  const user = await prisma.user.update({
    where: { id: parseInt(req.params.id) },
    data: req.body,
  });
  res.json(user);
});

// DELETE remove user by ID
router.delete("/:id", async (req, res) => {
  await prisma.user.delete({
    where: { id: parseInt(req.params.id) },
  });
  res.status(204).end();
});

export default router;
