const { BookingService } = require('../Services');

class BookingController {
    constructor(db) {
        this.bookingService = new BookingService(db);
    }

    async getById(req, res) {
        try {
            const { id } = req.params;
            const booking = await this.bookingService.getById(id);
            return res.json({ success: true, data: booking });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async getByUserId(req, res) {
        try {
            const { userId } = req.params;
            const bookings = await this.bookingService.getByUserId(userId);
            return res.json({ success: true, data: bookings });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async getExpired(req, res) {
        try {
            const expiredBookings = await this.bookingService.getExpired();
            return res.json({ success: true, data: expiredBookings });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async create(req, res) {
        try {
            const result = await this.bookingService.insert(req.body);
            return res.status(201).json({ success: true, data: result });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async updateStatus(req, res) {
        try {
            const { id } = req.params;
            const { status } = req.body;
            await this.bookingService.updateStatus(id, status);
            return res.json({ success: true, message: 'Cập nhật trạng thái đặt vé thành công' });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async delete(req, res) {
        try {
            const { id } = req.params;
            await this.bookingService.delete(id);
            return res.json({ success: true, message: 'Xóa đặt vé thành công' });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }
}

module.exports = BookingController;