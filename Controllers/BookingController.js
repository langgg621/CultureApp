const { BookingService } = require('../Services');
const { ResponseUtil } = require('../Utils');

class BookingController {
    constructor(db) {
        this.bookingService = new BookingService(db);
    }

    async getById(req, res) {
        try {
            const { id } = req.params;
            const booking = await this.bookingService.getById(id);
            if (!booking) {
                return ResponseUtil.error(res, 'Booking not found', 404);
            }
            return ResponseUtil.success(res, booking, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async getByUserId(req, res) {
        try {
            const { userId } = req.params;
            const bookings = await this.bookingService.getByUserId(userId);
            return ResponseUtil.success(res, bookings, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async getExpired(req, res) {
        try {
            const expiredBookings = await this.bookingService.getExpired();
            return ResponseUtil.success(res, expiredBookings, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async create(req, res) {
        try {
            const userIdFromToken = req.user ? req.user.UserID : req.body.UserID; 
            const bookingData = req.body; 
            const result = await this.bookingService.insert(bookingData, userIdFromToken);
            return ResponseUtil.success(res, result, 'Booking created successfully', 201);
        } catch (error) {
            return ResponseUtil.error(res, error.message, 400);
        }
    }

    async updateStatus(req, res) {
        try {
            const { id } = req.params;
            const { status } = req.body;
            await this.bookingService.updateStatus(id, status);
            return ResponseUtil.success(res, null, 'Booking status updated successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async delete(req, res) {
        try {
            const { id } = req.params;
            await this.bookingService.delete(id);
            return ResponseUtil.success(res, null, 'Booking deleted successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }
}

module.exports = BookingController;