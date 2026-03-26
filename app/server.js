import express from "express";
import healthRoutes from "./routes/health.js";
import echoRoutes from "./routes/echo.js";

const app = express();
app.use(express.json());
const PORT = 3000;

// Root route
app.get("/", (req, res) => {
  res.json({
    message: "API is running",
  });
});

// Plug routes
app.use("/", healthRoutes);
app.use("/", echoRoutes);

// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
