const express = require('express');
const router = express.Router();
const db = require('../db');

// Get all sessions
router.get('/', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM session');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Complex Query: Trainer workload on specific date
router.get('/trainer-workload/:date', async (req, res) => {
  const { date } = req.params;
  try {
    const [rows] = await db.query(`
      SELECT 
        t.Trainer_ID,
        CONCAT(t.First_Name, ' ', t.Last_Name) AS Trainer_Name,
        t.Specialization,
        COUNT(s.Session_ID) AS Total_Sessions,
        GROUP_CONCAT(s.Session_Type SEPARATOR ', ') AS Session_Types,
        GROUP_CONCAT(s.Room_No SEPARATOR ', ') AS Rooms_Used,
        MIN(s.Start_Time) AS First_Session,
        MAX(s.End_Time) AS Last_Session
      FROM trainer t
      INNER JOIN session s ON t.Trainer_ID = s.Trainer_ID
      WHERE s.Date = ?
      GROUP BY t.Trainer_ID, t.First_Name, t.Last_Name, t.Specialization
      HAVING COUNT(s.Session_ID) > 2
      ORDER BY Total_Sessions DESC
    `, [date]);
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;