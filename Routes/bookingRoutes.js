const express = require('express');
const router = express.Router();
const { BookingController } = require('../Controllers');
const { AuthMiddleware, ValidateMiddleware } = require('../Middlewares');


module.exports = (db) => {
    const bookingController = new BookingController(db);
    router.use(AuthMiddleware.authenticateToken);

    router.get('/expired', (req, res) => bookingController.getExpired(req, res));
    router.get('/byuser/:userId', (req, res) => bookingController.getByUserId(req, res));
    router.get('/:id', (req, res) => bookingController.getById(req, res));
    router.post('/', ValidateMiddleware.validateBookingCreate, (req, res) => bookingController.create(req, res));
    router.patch('/:id/status', (req, res) => bookingController.updateStatus(req, res));
    router.delete('/:id', (req, res) => bookingController.delete(req, res));

    return router;
};