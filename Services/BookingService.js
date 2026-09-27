const { Booking } = require('../Entities');

class BookingService {
    constructor(db) {
        this.db = db; // mysql2 pool hoặc connection
    }

    async getById(bookingId) {
        const [rows] = await this.db.query('CALL usp_Booking_GetByID(?)', [bookingId]);
        return rows[0] || [];
    }

    async getByUserId(userId) {
        const [rows] = await this.db.query('CALL usp_Booking_GetByUserID(?)', [userId]);
        return rows[0] || [];
    }

    async getExpired() {
        const [rows] = await this.db.query('CALL usp_Booking_GetExpired()');
        return rows[0] || [];
    }

    async insert(bookingData) {
        const booking = bookingData instanceof Booking ? bookingData : new Booking(bookingData);
        await this.db.query('CALL usp_Booking_Insert(?, ?, ?, ?, ?, ?)', [
            booking.BookingID,
            booking.UserID,
            booking.EventID,
            booking.BookingCode,
            booking.CreateDate_Tick,
            booking.CreateDate,
            booking.ExpiredAt
        ]);
        return booking;
    }

    async updateStatus(bookingId, status) {
        await this.db.query('CALL usp_Booking_UpdateStatus(?, ?)', [bookingId, status]);
        return true;
    }

    async delete(bookingId) {
        await this.db.query('CALL usp_Booking_Delete(?)', [bookingId]);
        return true;
    }
}

module.exports = BookingService;