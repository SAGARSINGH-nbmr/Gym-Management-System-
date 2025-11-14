const express = require('express');
const router = express.Router();
const db = require('../db');

// Complex Query: Members with expired subscriptions
router.get('/expired-members', async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT 
        m.Member_ID,
        CONCAT(m.First_Name, ' ', m.Last_Name) AS Member_Name,
        m.Phone,
        m.Email,
        m.Address,
        s.Sub_Type AS Subscription_Type,
        s.Start_Date,
        s.End_Date,
        s.Price,
        DATEDIFF(CURDATE(), s.End_Date) AS Days_Expired,
        CASE 
          WHEN DATEDIFF(CURDATE(), s.End_Date) <= 7 THEN 'Recently Expired'
          WHEN DATEDIFF(CURDATE(), s.End_Date) <= 30 THEN 'Expired This Month'
          ELSE 'Long Expired'
        END AS Expiry_Category
      FROM member m
      INNER JOIN subscription s ON m.Sub_ID = s.Sub_ID
      WHERE s.End_Date < CURDATE()
      ORDER BY Days_Expired DESC
    `);
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;