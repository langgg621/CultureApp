const { EventService } = require('../Services');

class EventController {
    constructor(db) {
        this.eventService = new EventService(db);
    }

    async getAll(req, res) {
        try {
            const pageIndex = parseInt(req.query.pageIndex) || 1;
            const pageSize = parseInt(req.query.pageSize) || 10;
            const events = await this.eventService.getAll(pageIndex, pageSize);
            return res.json({ success: true, data: events });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async getById(req, res) {
        try {
            const { id } = req.params;
            const event = await this.eventService.getById(id);
            if (!event) {
                return res.status(404).json({ success: false, message: 'Không tìm thấy sự kiện' });
            }
            return res.json({ success: true, data: event });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async search(req, res) {
        try {
            const { date, categoryId, venueId, minPrice, maxPrice, sortBy } = req.query;
            const events = await this.eventService.search({
                date: date || null,
                categoryId: categoryId || null,
                venueId: venueId || null,
                minPrice: minPrice ? parseFloat(minPrice) : null,
                maxPrice: maxPrice ? parseFloat(maxPrice) : null,
                sortBy: sortBy || null
            });
            return res.json({ success: true, data: events });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async create(req, res) {
        try {
            const userId = req.user ? req.user.UserID : req.body.UserID;
            const newEvent = await this.eventService.insert(req.body, userId);
            return res.status(201).json({ success: true, data: newEvent });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async update(req, res) {
        try {
            const { id } = req.params;
            const eventData = { ...req.body, EventID: id };
            const updatedEvent = await this.eventService.update(eventData);
            return res.json({ success: true, data: updatedEvent });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async delete(req, res) {
        try {
            const { id } = req.params;
            await this.eventService.delete(id);
            return res.json({ success: true, message: 'Xóa sự kiện thành công' });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }
}

module.exports = EventController;