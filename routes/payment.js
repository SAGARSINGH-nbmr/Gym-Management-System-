const express = require('express');
const router = express.Router();
const db = require('../db');

// Get all payments
router.get('/', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM payment');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Complex Query: Payment summary by mode
router.get('/summary-by-mode', async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT 
        Mode AS Payment_Mode,
        COUNT(*) AS Total_Transactions,
        SUM(Amount) AS Total_Amount,
        AVG(Amount) AS Average_Amount,
        MIN(Amount) AS Minimum_Payment,
        MAX(Amount) AS Maximum_Payment
      FROM payment
      WHERE Status = 'Paid'
      GROUP BY Mode
      HAVING SUM(Amount) > 0
      ORDER BY Total_Amount DESC
    `);
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;