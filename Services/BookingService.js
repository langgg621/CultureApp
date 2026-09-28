const { Booking } = require('../Entities');
const { HashUtil, IdGenerator, ResponseUtil } = require('../Utils');

class BookingService {
    constructor(db) {
        this.db = db; 
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

    async insert(bookingData, UserID) {
        const booking = bookingData instanceof Booking ? bookingData : new Booking(bookingData);
        await this.db.query('CALL usp_Booking_Insert(?, ?, ?, ?, ?)', [
            booking.BookingID = IdGenerator.generateId,
            UserID,
            booking.EventID,
            booking.BookingCode = IdGenerator.BookingCode,
            booking.ExpiredAt
        ]);
        return true;
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