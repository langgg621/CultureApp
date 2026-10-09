const { Event } = require('../Entities');
const { IdGenerator, DateTimeUtil } = require('../Utils');

class EventService {
    constructor(db) {
        this.db = db;
    }

    async getAll(pageIndex, pageSize) {
        const [rows] = await this.db.query('CALL usp_Event_GetAll(?, ?)', [pageIndex, pageSize]);
        return rows[0] || [];
    }

    async getById(eventId) {
        const [rows] = await this.db.query('CALL usp_Event_GetByID(?)', [eventId]);
        return rows[0] && rows[0][0] ? rows[0][0] : null;
    }

    async search({ date = null, categoryId = null, venueId = null, minPrice = null, maxPrice = null, sortBy = null, pageIndex = 0,
    pageSize = 0 }) {
        const formattedDate = date ? DateTimeUtil.toMySQLDateTime(date) : null;
        const [rows] = await this.db.query(
            'CALL usp_Event_Search(?, ?, ?, ?, ?, ?,?,?)',
            [formattedDate, categoryId, venueId, minPrice, maxPrice, sortBy, parseInt(pageIndex) || 1,parseInt(pageSize) || 10]
        );
        return rows[0] || [];
    }

    async insert(eventData) {
        const event = eventData instanceof Event ? eventData : new Event(eventData);
        event.EventID = event.EventID || IdGenerator.generateId();
        const eventDateFormatted = DateTimeUtil.toMySQLDateTime(event.EventDate || new Date());

        const connection = await this.db.getConnection();
        try {
            await connection.beginTransaction();
            await connection.query('CALL usp_Event_Insert(?, ?, ?, ?, ?, ?, ?)', [
                event.EventID,
                event.EventName,
                event.Description,
                event.CategoryID,
                event.VenueID,
                eventDateFormatted,
                event.Status
            ]);
            await connection.query('CALL usp_Ticket_GenerateByEvent(?, ?, ?, ?)', [
                event.EventID,
                eventData.PriceBasic || 0,
                eventData.PriceVIP || 0,
                eventData.PriceVVIP || 0
            ]);
            await connection.commit();
            return true;
        } catch (error) {
            await connection.rollback();
            throw error;
        } finally {
            connection.release();
        }
    }

    async update(eventData) {
        const [existingRows] = await this.db.query('CALL usp_Event_GetByID(?)', [eventData.EventID]);
        const currentEvent = existingRows[0] && existingRows[0][0] ? existingRows[0][0] : null;
        if (!currentEvent) {
            throw new Error('Event does not exist.');
        }

        const updatedEvent = {
            EventID: eventData.EventID,
            EventName: eventData.EventName ?? currentEvent.EventName,
            Description: eventData.Description ?? currentEvent.Description,
            CategoryID: eventData.CategoryID ?? currentEvent.CategoryID,
            VenueID: eventData.VenueID ?? currentEvent.VenueID,
            EventDate: DateTimeUtil.toMySQLDateTime(eventData.EventDate ?? currentEvent.EventDate),
            Status: eventData.Status ?? currentEvent.Status
        };

        const isVenueChanged = eventData.VenueID && eventData.VenueID !== currentEvent.VenueID;
        const connection = await this.db.getConnection();
        try {
            await connection.beginTransaction();
            await connection.query('CALL usp_Event_Update(?, ?, ?, ?, ?, ?, ?)', [
                updatedEvent.EventID,
                updatedEvent.EventName,
                updatedEvent.Description,
                updatedEvent.CategoryID,
                updatedEvent.VenueID,
                updatedEvent.EventDate,
                updatedEvent.Status
            ]);
            if (isVenueChanged) {
                await connection.query('CALL usp_Ticket_DeleteByEventID(?)', [updatedEvent.EventID]);
                await connection.query('CALL usp_Ticket_GenerateByEvent(?, ?, ?, ?)', [
                    updatedEvent.EventID,
                    eventData.PriceBasic || 0,
                    eventData.PriceVIP || 0,
                    eventData.PriceVVIP || 0
                ]);
            }
            await connection.commit();
            return updatedEvent;
        } catch (error) {
            await connection.rollback();
            throw error;
        } finally {
            connection.release();
        }
    }

    async delete(eventId) {
        await this.db.query('CALL usp_Event_Delete(?)', [eventId]);
        return true;
    }

    async updateStatus(eventId, status) {
        await this.db.query('CALL usp_Event_UpdateStatus(?, ?)', [eventId, status]);
        return true;
    }
}

module.exports = EventService;