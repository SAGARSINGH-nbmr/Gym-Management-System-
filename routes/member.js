const express = require('express');
const router = express.Router();
const db = require('../db');

// Get all members
router.get('/', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM member');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Complex Query: Members with upcoming birthdays in next 30 days
router.get('/upcoming-birthdays', async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT 
        Member_ID,
        CONCAT(First_Name, ' ', Last_Name) AS Full_Name,
        DOB AS Date_of_Birth,
        Phone,
        Email,
        DATEDIFF(
          DATE_ADD(DOB, INTERVAL YEAR(CURDATE()) - YEAR(DOB) + IF(DAYOFYEAR(DOB) < DAYOFYEAR(CURDATE()), 1, 0) YEAR),
          CURDATE()
        ) AS Days_Until_Birthday
      FROM member
      WHERE DAYOFYEAR(DOB) BETWEEN DAYOFYEAR(CURDATE()) 
        AND DAYOFYEAR(DATE_ADD(CURDATE(), INTERVAL 30 DAY))
      ORDER BY Days_Until_Birthday
    `);
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});
module.exports = router;