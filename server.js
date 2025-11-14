const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');

const memberRoutes = require('./routes/member');
const paymentRoutes = require('./routes/payment');
const sessionRoutes = require('./routes/session');
const equipmentRoutes = require('./routes/equipment');
const subscriptionRoutes = require('./routes/subscription');

dotenv.config();
const app = express();

app.use(cors({
  origin: '*',
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type'],
}));

app.use(express.json());

app.use('/api/members', memberRoutes);
app.use('/api/payments', paymentRoutes);
app.use('/api/sessions', sessionRoutes);
app.use('/api/equipment', equipmentRoutes);
app.use('/api/subscriptions', subscriptionRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
