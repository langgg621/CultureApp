const { TicketService } = require('../Services');
const { ResponseUtil } = require('../Utils');

class TicketController {
    constructor(db) {
        this.ticketService = new TicketService(db);
    }

    async getById(req, res) {
        try {
            const { id } = req.params;
            const ticket = await this.ticketService.getById(id);
            if (!ticket) {
                return ResponseUtil.error(res, 'Ticket not found', 404);
            }
            return ResponseUtil.success(res, ticket, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async getByEventId(req, res) {
        try {
            const { eventId } = req.params;
            const tickets = await this.ticketService.getByEventId(eventId);
            return ResponseUtil.success(res, tickets, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async getAvailableByEvent(req, res) {
        try {
            const { eventId } = req.params;
            const tickets = await this.ticketService.getAvailableByEvent(eventId);
            return ResponseUtil.success(res, tickets, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async getByBookingId(req, res) {
        try {
            const { bookingId } = req.params;
            const tickets = await this.ticketService.getByBookingId(bookingId);
            return ResponseUtil.success(res, tickets, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async generateByEvent(req, res) {
        try {
            const { eventId, priceBasic, priceVIP, priceVVIP } = req.body;
            await this.ticketService.generateByEvent(eventId, priceBasic, priceVIP, priceVVIP);
            return ResponseUtil.success(res, null, 'Tickets generated successfully', 201);
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async updateStatus(req, res) {
        try {
            const { id } = req.params;
            const { status, bookingId } = req.body;
            await this.ticketService.updateStatus(id, status, bookingId);
            return ResponseUtil.success(res, null, 'Ticket status updated successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async delete(req, res) {
        try {
            const { id } = req.params;
            await this.ticketService.delete(id);
            return ResponseUtil.success(res, null, 'Ticket deleted successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }
}

module.exports = TicketController;