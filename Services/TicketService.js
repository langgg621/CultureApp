const { Ticket } = require('../Entities');
const { HashUtil, IdGenerator, ResponseUtil } = require('../Utils');

class TicketService {
    constructor(db) {
        this.db = db;
    }

    async getById(ticketId) {
        const [rows] = await this.db.query('CALL usp_Ticket_GetByID(?)', [ticketId]);
        if (rows[0] && rows[0][0]) {
            return Ticket.fromDatabaseRow(rows[0][0]);
        }
        return null;
    }

    async getByEventId(eventId) {
        const [rows] = await this.db.query('CALL usp_Ticket_GetByEventID(?)', [eventId]);
        return (rows[0] || []).map(row => Ticket.fromDatabaseRow(row));
    }
    async getAvailableByEvent(eventId) {
        const [rows] = await this.db.query('CALL usp_Ticket_GetAvailableByEvent(?)', [eventId]);
        return (rows[0] || []).map(row => Ticket.fromDatabaseRow(row));
    }

    async getByBookingId(bookingId) {
        const [rows] = await this.db.query('CALL usp_Ticket_GetByBookingID(?)', [bookingId]);
        return (rows[0] || []).map(row => Ticket.fromDatabaseRow(row));
    }

    async generateByEvent(eventId, priceBasic, priceVIP, priceVVIP) {
        await this.db.query('CALL usp_Ticket_GenerateByEvent(?, ?, ?, ?)', [
            eventId,
            priceBasic,
            priceVIP,
            priceVVIP
        ]);
        return true;
    }

    async updateStatus(ticketId, status, bookingId = null) {
        await this.db.query('CALL usp_Ticket_UpdateStatus(?, ?, ?)', [
            ticketId,
            status,
            bookingId
        ]);
        return true;
    }
}

module.exports = TicketService;