const { PaymentService } = require('../Services');
const { ResponseUtil } = require('../Utils');

class PaymentController {
    constructor(db) {
        this.paymentService = new PaymentService(db);
    }

    async getByBookingId(req, res) {
        try {
            const { bookingId } = req.params;
            const payment = await this.paymentService.getByBookingId(bookingId);
            if (!payment) {
                return ResponseUtil.error(res, 'Payment not found for this booking', 404);
            }
            return ResponseUtil.success(res, payment, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async create(req, res) {
        try {
            const userIdFromToken = req.user ? req.user.UserID : req.body.UserID;
            const result = await this.paymentService.create(req.body, userIdFromToken);
            return ResponseUtil.success(res, result, 'Payment created successfully', 201);
        } catch (error) {
            return ResponseUtil.error(res, error.message, 400);
        }
    }

    async update(req, res) {
        try {
            const { id } = req.params;
            const { transactionId, status, paidAt } = req.body;
            const result = await this.paymentService.update(id, transactionId, status, paidAt);
            return ResponseUtil.success(res, result, 'Payment status updated successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }
}

module.exports = PaymentController;