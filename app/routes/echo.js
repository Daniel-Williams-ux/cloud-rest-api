import express from 'express';
import { validateEcho } from '../middleware/validateEcho.js';

const router = express.Router();

router.post('/echo', validateEcho, (req, res) => {
  const { name, role } = req.body;

  res.json({
    youSent: { name, role },
  });
});

export default router;
