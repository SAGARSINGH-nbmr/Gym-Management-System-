const express = require('express');
const router = express.Router();
const db = require('../db');

// Get all equipment
router.get('/', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM equipment');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Complex Query: Equipment maintenance alert
router.get('/maintenance-alert', async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT 
        Equipment_ID,
        Equipment_Name,
        Equipment_Type,
        Condition_Status,
        Last_Service_Date,
        Next_Service_Date,
        DATEDIFF(Next_Service_Date, CURDATE()) AS Days_Remaining,
        CASE 
          WHEN DATEDIFF(Next_Service_Date, CURDATE()) <= 3 THEN 'URGENT'
          WHEN DATEDIFF(Next_Service_Date, CURDATE()) <= 7 THEN 'UPCOMING'
          ELSE 'NORMAL'
        END AS Priority
      FROM equipment
      WHERE DATEDIFF(Next_Service_Date, CURDATE()) <= 7
        AND DATEDIFF(Next_Service_Date, CURDATE()) >= 0
      ORDER BY Days_Remaining ASC
    `);
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;