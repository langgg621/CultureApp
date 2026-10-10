const { Booking } = require('../Entities');
const { IdGenerator, DateTimeUtil } = require('../Utils');
const redis = require('../config/redis');
class BookingService {
    constructor(db) {
        this.db = db; 
    }

    async getById(bookingId) {
        const [bookingRows] = await this.db.query('CALL usp_Booking_GetByID(?)', [bookingId]);
        const bookingList = bookingRows[0];
        if (!bookingList || bookingList.length === 0) {
            return null;
        }
        const booking = bookingList[0];
        const [ticketRows] = await this.db.query('CALL usp_Ticket_GetByBookingID(?)', [bookingId]);
        booking.tickets = ticketRows[0] || [];
        return booking;
    }

    async getByUserId(userId) {
        const [bookingRows] = await this.db.query('CALL usp_Booking_GetByUserID(?)', [userId]);
        const bookings = bookingRows[0] || [];

        if (bookings.length === 0) {
            return [];
        }
        const bookingsWithTickets = await Promise.all(
            bookings.map(async (booking) => {
                const [ticketRows] = await this.db.query('CALL usp_Ticket_GetByBookingID(?)', [booking.BookingID]);
                return {
                    ...booking,
                    tickets: ticketRows[0] || []
                };
            })
        );
        return bookingsWithTickets;
    }

    async getExpired() {
        const [rows] = await this.db.query('CALL usp_Booking_GetExpired()');
        return rows[0] || [];
    }

    async insert(bookingData, UserID) {
        const booking = bookingData instanceof Booking ? bookingData : new Booking(bookingData);
        const tickets = booking.tickets || [];
        const ticketIds = tickets.map(t => typeof t === 'string' ? t : t.TicketID);
        if (!ticketIds || ticketIds.length === 0) {
            throw new Error('Please choose one ticket to create booking');
        }
        const resolvedUserId = UserID;
        const fifteenMinutesInSeconds = 900; // 15 minutes
        const lockedTicketIds = [];
        try {
            // temporary lock on redis
            for (const ticketId of ticketIds) {
                const lockKey = `ticket:lock:${ticketId}`;
                // Use 'NX' to claim the lock if it is currently unclaimed; 'EX 900' self-destructs after 15 minutes.
                const result = await redis.set(lockKey, resolvedUserId, 'EX', fifteenMinutesInSeconds, 'NX');
                
                if (!result) {
                    if (lockedTicketIds.length > 0) {
                        for (const lockedId of lockedTicketIds) {
                            await redis.del(`ticket:lock:${lockedId}`);
                        }
                    }
                    throw new Error(`Ticket ${ticketId} is currently held by another user. Please choose another.`);
                }
                lockedTicketIds.push(ticketId);
            }

            //TRANSACTION on MYSQL 
            const connection = await this.db.getConnection();
            try {
                await connection.beginTransaction();
                const [spResult] = await connection.query('CALL usp_Ticket_GetByID(?)', [ticketIds[0]]);
                const ticketList = spResult[0];
                if (!ticketList || ticketList.length === 0) {
                    throw new Error('Information not available or does not exist');
                }
                const eventId = ticketList[0].EventID;
                booking.BookingID = booking.BookingID || IdGenerator.generateId();
                booking.BookingCode = booking.BookingCode || IdGenerator.generateBookingCode();
                booking.EventID = eventId;

                const expiredAtFormatted = booking.ExpiredAt 
                    ? DateTimeUtil.toMySQLDateTime(booking.ExpiredAt) 
                    : DateTimeUtil.toMySQLDateTime(new Date(Date.now() + 15 * 60 * 1000)); // Hết hạn sau 15 phút

                await connection.query('CALL usp_Booking_Insert(?, ?, ?, ?, ?)', [
                    booking.BookingID,
                    resolvedUserId,
                    booking.EventID,
                    booking.BookingCode,
                    expiredAtFormatted
                ]);

                for (const ticketId of ticketIds) {
                    await connection.query('CALL usp_Ticket_UpdateStatus(?, ?, ?)', [
                        ticketId,
                        2, // Status 2: Locked
                        booking.BookingID
                    ]);
                }

                await connection.commit();
                return booking;

            } catch (dbError) {
                for (const ticketId of lockedTicketIds) {
                    await redis.del(`ticket:lock:${ticketId}`);
                }
                await connection.rollback();
                throw dbError;

            } finally {
                connection.release();
            }

        } catch (error) {
            throw error;
        }
    }

    async updateStatus(bookingId, status) {
        const connection = await this.db.getConnection();

        try {
            await connection.beginTransaction();
            await connection.query('CALL usp_Booking_UpdateStatus(?, ?)', [bookingId, status]);

            const targetStatus = Number(status);
            if (targetStatus === 2) { 
                await connection.query('CALL usp_Ticket_UpdateStatusByBookingID(?, ?)', [3, bookingId]);
            } else if (targetStatus === 3) { 
                await connection.query('CALL usp_Ticket_UpdateStatusByBookingID(?, ?)', [1, bookingId]);
            }

            await connection.commit();
            return true;
        } catch (error) {
            await connection.rollback();
            throw error;
        } finally {
            connection.release();
        }
    }

    async delete(bookingId) {
        const connection = await this.db.getConnection();
        try {
            await connection.beginTransaction();
            await connection.query('CALL usp_Ticket_UpdateStatusByBookingID(?, ?)', [1, bookingId]);
            await connection.query('CALL usp_Booking_Delete(?)', [bookingId]);
            await connection.commit();
            return true;
        } catch (error) {
            await connection.rollback();
            throw error;
        } finally {
            connection.release();
        }
    }
}

module.exports = BookingService;