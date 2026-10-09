const express = require('express');
const bookingRoutes = require('./bookingRoutes');
const eventRoutes = require('./eventRoutes');
const ticketRoutes = require('./ticketRoutes');
const userRoutes = require('./userRoutes');
const venueRoutes = require('./venueRoutes');
const categoryRoutes = require('./categoryRoutes');
const paymentRoutes = require('./paymentRoutes');
module.exports = (db) => {
    const router = express.Router();

    router.use('/bookings', bookingRoutes(db));
    router.use('/events', eventRoutes(db));
    router.use('/tickets', ticketRoutes(db));
    router.use('/users', userRoutes(db));
    router.use('/venues', venueRoutes(db));
    router.use('/categories', categoryRoutes(db));
    router.use('/payments', paymentRoutes(db));

    return router;
};