import express from "express";
import { PrismaClient } from "@prisma/client";

const router = express.Router();
const prisma = new PrismaClient();

// GET all hosts
router.get("/", async (req, res) => {
  const hosts = await prisma.host.findMany();
  res.json(hosts);
});

// POST create new host
router.post("/", async (req, res) => {
  const host = await prisma.host.create({
    data: req.body,
  });
  res.status(201).json(host);
});

// GET single host by ID
router.get("/:id", async (req, res) => {
  const host = await prisma.host.findUnique({
    where: { id: parseInt(req.params.id) },
  });
  if (host) {
    res.json(host);
  } else {
    res.status(404).json({ error: "Host not found" });
  }
});

// PUT update host by ID
router.put("/:id", async (req, res) => {
  const host = await prisma.host.update({
    where: { id: parseInt(req.params.id) },
    data: req.body,
  });
  res.json(host);
});

// DELETE remove host by ID
router.delete("/:id", async (req, res) => {
  await prisma.host.delete({
    where: { id: parseInt(req.params.id) },
  });
  res.status(204).end();
});

export default router;
