const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');

// Load admin environment variables
dotenv.config({ path: '.env.admin' });

const memberRoutes = require('./routes/member');
const paymentRoutes = require('./routes/payment');
const sessionRoutes = require('./routes/session');
const equipmentRoutes = require('./routes/equipment');
const subscriptionRoutes = require('./routes/subscription');

const app = express();

app.use(cors());
app.use(express.json());

// Admin has access to ALL routes
app.use('/api/members', memberRoutes);
app.use('/api/payments', paymentRoutes);
app.use('/api/sessions', sessionRoutes);
app.use('/api/equipment', equipmentRoutes);
app.use('/api/subscriptions', subscriptionRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log('\n╔════════════════════════════════════════╗');
  console.log('║   🔐 ADMIN SERVER STARTED             ║');
  console.log('╠════════════════════════════════════════╣');
  console.log(`║   Port: ${PORT}                           ║`);
  console.log(`║   User: ${process.env.DB_USER}                  ║`);
  console.log('║   Access: FULL PRIVILEGES             ║');
  console.log('║   (SELECT, INSERT, UPDATE, DELETE)    ║');
  console.log('╚════════════════════════════════════════╝\n');
});
