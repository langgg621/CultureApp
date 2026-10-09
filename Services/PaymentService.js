const { Payment } = require('../Entities');
const { IdGenerator, DateTimeUtil } = require('../Utils');

class PaymentService {
    constructor(db) {
        this.db = db;
    }

    async getByBookingId(bookingId) {
        const [spResult] = await this.db.query('CALL usp_Payment_GetByBookingID(?)', [bookingId]);
        const rows = spResult[0];

        if (rows && rows[0]) {
            return Payment.fromDatabaseRow(rows[0]);
        }
        return null;
    }

    async create(paymentData, userId) {
        const payment = paymentData instanceof Payment ? paymentData : new Payment(paymentData);

        if (!payment.BookingID) {
            throw new Error('BookingID is required.');
        }

        const connection = await this.db.getConnection();

        try {
            await connection.beginTransaction();

            const [bookingRows] = await connection.query('CALL usp_Booking_GetByID(?)', [payment.BookingID]);
            const bookingList = bookingRows[0];

            if (!bookingList || bookingList.length === 0) {
                throw new Error('Booking not found.');
            }

            const currentBooking = bookingList[0];

            if (Number(currentBooking.Status) === 2) {
                throw new Error('This booking has already been paid.');
            }
            if (Number(currentBooking.Status) === 3) {
                throw new Error('Cannot process payment for a canceled booking.');
            }

            const paidAtFormatted = DateTimeUtil.toMySQLDateTime(payment.PaidAt || new Date());
            payment.PaymentID = payment.PaymentID || IdGenerator.generateId();
            payment.TransactionID = payment.TransactionID || IdGenerator.generateId();
            payment.Amount = payment.Amount > 0 ? payment.Amount : parseFloat(currentBooking.TotalAmount || 0);
            payment.Status = Number(payment.Status) || 2;
            payment.PaidAt = paidAtFormatted;

            await connection.query('CALL usp_Payment_Create(?, ?, ?, ?, ?, ?, ?)', [
                payment.PaymentID,
                payment.BookingID,
                payment.PaymentMethod,
                payment.TransactionID,
                payment.Amount,
                payment.Status,
                payment.PaidAt
            ]);

            if (payment.Status === 2) {
                await connection.query('CALL usp_Booking_UpdateStatus(?, ?)', [payment.BookingID, 2]);
                await connection.query('CALL usp_Ticket_UpdateStatusByBookingID(?, ?)', [3, payment.BookingID]);
            }

            await connection.commit();
            return payment;
        } catch (error) {
            await connection.rollback();
            throw error;
        } finally {
            connection.release();
        }
    }

    async update(paymentId, transactionId, status, paidAt) {
        const connection = await this.db.getConnection();

        try {
            await connection.beginTransaction();

            const statusNum = Number(status);
            const paidAtFormatted = DateTimeUtil.toMySQLDateTime(paidAt || new Date());

            const updateData = {
                PaymentID: paymentId,
                TransactionID: transactionId,
                Status: statusNum,
                PaidAt: paidAtFormatted
            };

            await connection.query('CALL usp_Payment_Update(?, ?, ?, ?)', [
                updateData.PaymentID,
                updateData.TransactionID,
                updateData.Status,
                updateData.PaidAt
            ]);

            const [spResult] = await connection.query('CALL usp_Payment_GetBookingIDByPaymentID(?)', [paymentId]);
            const paymentRows = spResult[0];

            if (paymentRows && paymentRows.length > 0) {
                const bookingId = paymentRows[0].BookingID;

                if (statusNum === 2) {
                    await connection.query('CALL usp_Booking_UpdateStatus(?, ?)', [bookingId, 2]);
                    await connection.query('CALL usp_Ticket_UpdateStatusByBookingID(?, ?)', [3, bookingId]);
                } else if (statusNum === 3 || statusNum === 4) {
                    await connection.query('CALL usp_Booking_UpdateStatus(?, ?)', [bookingId, 3]);
                    await connection.query('CALL usp_Ticket_UpdateStatusByBookingID(?, ?)', [1, bookingId]);
                }
            }

            await connection.commit();
            return updateData;
        } catch (error) {
            await connection.rollback();
            throw error;
        } finally {
            connection.release();
        }
    }
}

module.exports = PaymentService;