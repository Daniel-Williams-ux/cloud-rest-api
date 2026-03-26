import express from "express";

const router = express.Router();

router.post("/echo", (req, res) => {
  res.json({
    youSent: req.body,
  });
});

export default router;
