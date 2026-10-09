const express = require('express');
const router = express.Router();
const { PaymentController } = require('../Controllers');
const { AuthMiddleware, ValidateMiddleware } = require('../Middlewares');

module.exports = (db) => {
    const paymentController = new PaymentController(db);
    
    // Tất cả API thanh toán yêu cầu đăng nhập
    router.use(AuthMiddleware.authenticateToken);

    router.get('/booking/:bookingId', (req, res) => paymentController.getByBookingId(req, res));
    router.post('/', (req, res) => paymentController.create(req, res));
    router.put('/:id', (req, res) => paymentController.update(req, res));

    return router;
};