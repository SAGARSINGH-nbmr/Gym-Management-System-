const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');

// Load user environment variables
dotenv.config({ path: '.env.user' });

const memberRoutes = require('./routes/member');
const sessionRoutes = require('./routes/session');
const equipmentRoutes = require('./routes/equipment');

const app = express();

app.use(cors());
app.use(express.json());

// User has access to LIMITED routes (read-only)
app.use('/api/members', memberRoutes);
app.use('/api/sessions', sessionRoutes);
app.use('/api/equipment', equipmentRoutes);

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log('\n╔════════════════════════════════════════╗');
  console.log('║   👤 USER SERVER STARTED              ║');
  console.log('╠════════════════════════════════════════╣');
  console.log(`║   Port: ${PORT}                           ║`);
  console.log(`║   User: ${process.env.DB_USER}                    ║`);
  console.log('║   Access: READ-ONLY                   ║');
  console.log('║   (SELECT only)                       ║');
  console.log('╚════════════════════════════════════════╝\n');
});



