import express from "express";
import helmet from 'helmet';
import { logger } from './middleware/logger.js';
import healthRoutes from "./routes/health.js";
import echoRoutes from "./routes/echo.js";
import { errorHandler } from './middleware/errorHandler.js';

const app = express();

// security first
app.use(helmet()); 

//converts raw request to JavaScript object
app.use(express.json()); 

//logger for basic observability
app.use(logger);

const PORT = process.env.PORT || 3000;

// Root route
app.get("/", (req, res) => {
  res.json({
    message: "API is running",
  });
});

// Plug routes
app.use('/api', echoRoutes);
app.use("/", healthRoutes);

// Error handler (MUST BE LAST)
app.use(errorHandler);

// Start server
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server running on port ${PORT}`);
});
