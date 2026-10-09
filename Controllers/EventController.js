const { EventService } = require('../Services');
const { ResponseUtil } = require('../Utils');

class EventController {
    constructor(db) {
        this.eventService = new EventService(db);
    }

    async getAll(req, res) {
        try {
            const pageIndex = parseInt(req.query.pageIndex) || 1;
            const pageSize = parseInt(req.query.pageSize) || 10;
            const events = await this.eventService.getAll(pageIndex, pageSize);
            return ResponseUtil.success(res, events, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async getById(req, res) {
        try {
            const { id } = req.params;
            const event = await this.eventService.getById(id);
            if (!event) {
                return ResponseUtil.error(res, 'Event not found', 404);
            }
            return ResponseUtil.success(res, event, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
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
            return ResponseUtil.success(res, events, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async create(req, res) {
        try {
            const userId = req.user ? req.user.UserID : req.body.UserID;
            const newEvent = await this.eventService.insert(req.body, userId);
            return ResponseUtil.success(res, newEvent, 'Event created successfully', 201);
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async update(req, res) {
        try {
            const { id } = req.params;
            const eventData = { ...req.body, EventID: id };
            const updatedEvent = await this.eventService.update(eventData);
            return ResponseUtil.success(res, updatedEvent, 'Event updated successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async updateStatus(req, res) {
        try {
            const { id } = req.params;
            const { status } = req.body;
            await this.eventService.updateStatus(id, status);
            return ResponseUtil.success(res, null, 'Event status updated successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async delete(req, res) {
        try {
            const { id } = req.params;
            await this.eventService.delete(id);
            return ResponseUtil.success(res, null, 'Event deleted successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }
}

module.exports = EventController;