const { Event } = require('../Entities');
const { HashUtil, IdGenerator, ResponseUtil } = require('../Utils');

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

    async insert(eventData, UserID) {
        const event = eventData instanceof Event ? eventData : new Event(eventData);
        await this.db.query('CALL usp_Event_Insert(?, ?, ?, ?, ?, ?, ?, ?)', [
            event.EventID = IdGenerator.generateId(),
            event.EventName,
            event.Description,
            event.CategoryID,
            event.VenueID,
            UserID,
            event.EventDate,
            event.Status
        ]);
        return true;
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