const { Venue } = require('../Entities');

class VenueService {
    constructor(db) {
        this.db = db;
    }

    async getAll(pageIndex = 1, pageSize = 10) {
        const [rows] = await this.db.query('CALL usp_Venue_GetAll(?, ?)', [pageIndex, pageSize]);
        return (rows[0] || []).map(row => Venue.fromDatabaseRow(row));
    }

    async getById(venueId) {
        const [rows] = await this.db.query('CALL usp_Venue_GetByID(?)', [venueId]);
        if (rows[0] && rows[0][0]) {
            return Venue.fromDatabaseRow(rows[0][0]);
        }
        return null;
    }

    async getStats(venueId, startDate, endDate) {
        const [rows] = await this.db.query('CALL usp_Venue_GetStats(?, ?, ?)', [
            venueId,
            startDate,
            endDate
        ]);
        return rows[0] || [];
    }

    async insert(venueData) {
        const venue = venueData instanceof Venue ? venueData : new Venue(venueData);
        await this.db.query('CALL usp_Venue_Insert(?, ?, ?, ?, ?, ?)', [
            venue.VenueID,
            venue.VenueName,
            venue.VenueAddress,
            venue.Capacity,
            venue.SeatingRow,
            venue.SeatingCol
        ]);
        return venue;
    }

    async update(venueData) {
        const venue = venueData instanceof Venue ? venueData : new Venue(venueData);
        await this.db.query('CALL usp_Venue_Update(?, ?, ?, ?, ?, ?)', [
            venue.VenueID,
            venue.VenueName,
            venue.VenueAddress,
            venue.Capacity,
            venue.SeatingRow,
            venue.SeatingCol
        ]);
        return venue;
    }

    async delete(venueId) {
        await this.db.query('CALL usp_Venue_Delete(?)', [venueId]);
        return true;
    }
}

module.exports = VenueService;