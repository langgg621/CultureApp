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

    async insert(ticketData) {
        const ticket = ticketData instanceof Ticket ? ticketData : new Ticket(ticketData);
        await this.db.query('CALL usp_Ticket_Insert(?, ?, ?, ?, ?)', [
            ticket.TicketID = IdGenerator.generateId(),
            ticket.EventID,
            ticket.SeatRow,
            ticket.SeatNumber,
            ticket.Price
        ]);
        return true;
    }

    async update(ticketData) {
        const ticket = ticketData instanceof Ticket ? ticketData : new Ticket(ticketData);
        await this.db.query('CALL usp_Ticket_Update(?, ?, ?, ?)', [
            ticket.TicketID,
            ticket.SeatRow,
            ticket.SeatNumber,
            ticket.Price
        ]);
        return ticket;
    }

    async updateStatus(ticketId, status, bookingId) {
        await this.db.query('CALL usp_Ticket_UpdateStatus(?, ?, ?)', [ticketId, status, bookingId]);
        return true;
    }

    async delete(ticketId) {
        await this.db.query('CALL usp_Ticket_Delete(?)', [ticketId]);
        return true;
    }
}

module.exports = TicketService;