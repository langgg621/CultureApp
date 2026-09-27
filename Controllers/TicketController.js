const { TicketService } = require('../Services');

class TicketController {
    constructor(db) {
        this.ticketService = new TicketService(db);
    }

    async getById(req, res) {
        try {
            const { id } = req.params;
            const ticket = await this.ticketService.getById(id);
            if (!ticket) {
                return res.status(404).json({ success: false, message: 'Không tìm thấy vé' });
            }
            return res.json({ success: true, data: ticket });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async getByEventId(req, res) {
        try {
            const { eventId } = req.params;
            const tickets = await this.ticketService.getByEventId(eventId);
            return res.json({ success: true, data: tickets });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async create(req, res) {
        try {
            const newTicket = await this.ticketService.insert(req.body);
            return res.status(201).json({ success: true, data: newTicket });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async update(req, res) {
        try {
            const { id } = req.params;
            const ticketData = { ...req.body, TicketID: id };
            const updatedTicket = await this.ticketService.update(ticketData);
            return res.json({ success: true, data: updatedTicket });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async updateStatus(req, res) {
        try {
            const { id } = req.params;
            const { status, bookingId } = req.body;
            await this.ticketService.updateStatus(id, status, bookingId);
            return res.json({ success: true, message: 'Cập nhật trạng thái vé thành công' });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async delete(req, res) {
        try {
            const { id } = req.params;
            await this.ticketService.delete(id);
            return res.json({ success: true, message: 'Xóa vé thành công' });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }
}

module.exports = TicketController;