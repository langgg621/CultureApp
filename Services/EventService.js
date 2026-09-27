const { Event } = require('../Entities');

class EventService {
    constructor(db) {
        this.db = db;
    }

    async getAll(pageIndex = 1, pageSize = 10) {
        const [rows] = await this.db.query('CALL usp_Event_GetAll(?, ?)', [pageIndex, pageSize]);
        return rows[0] || [];
    }

    async getById(eventId) {
        const [rows] = await this.db.query('CALL usp_Event_GetByID(?)', [eventId]);
        return rows[0] && rows[0][0] ? rows[0][0] : null;
    }

    async search({ date = null, categoryId = null, venueId = null, minPrice = null, maxPrice = null, sortBy = null }) {
        const [rows] = await this.db.query(
            'CALL usp_Event_Search(?, ?, ?, ?, ?, ?)',
            [date, categoryId, venueId, minPrice, maxPrice, sortBy]
        );
        return rows[0] || [];
    }

    async insert(eventData, userId) {
        const event = eventData instanceof Event ? eventData : new Event(eventData);
        await this.db.query('CALL usp_Event_Insert(?, ?, ?, ?, ?, ?, ?, ?)', [
            event.EventID,
            event.EventName,
            event.Description,
            event.CategoryID,
            event.VenueID,
            userId,
            event.EventDate,
            event.Status
        ]);
        return event;
    }

    async update(eventData) {
        const event = eventData instanceof Event ? eventData : new Event(eventData);
        await this.db.query('CALL usp_Event_Update(?, ?, ?, ?, ?, ?, ?)', [
            event.EventID,
            event.EventName,
            event.Description,
            event.CategoryID,
            event.VenueID,
            event.EventDate,
            event.Status
        ]);
        return event;
    }

    async delete(eventId) {
        await this.db.query('CALL usp_Event_Delete(?)', [eventId]);
        return true;
    }
}

module.exports = EventService;