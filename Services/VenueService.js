const { Venue } = require('../Entities');
const { HashUtil, IdGenerator, ResponseUtil } = require('../Utils');

class VenueService {
    constructor(db) {
        this.db = db;
    }

    async getAll(pageIndex, pageSize) {
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
        venue.VenueID = venue.VenueID || IdGenerator.generateId();
        const connection = await this.db.getConnection();

        try {
            await connection.beginTransaction();
            await connection.query('CALL usp_Venue_Insert(?, ?, ?, ?, ?)', [
                venue.VenueID,
                venue.VenueName,
                venue.VenueAddress,
                venue.SeatingRow,
                venue.SeatingCol
            ]);
            await connection.query('CALL usp_VenueSeat_GenerateVenueMap(?, ?, ?, ?, ?)', [
                venue.VenueID,
                venue.SeatingRow,
                venue.SeatingCol,
                venue.VVipRow || 0, 
                venue.VipRow || 0
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

    async update(venueData) {
        const [existingRows] = await this.db.query('CALL usp_Venue_GetByID(?)', [venueData.VenueID || venueData.id]);
        const currentVenue = existingRows[0] && existingRows[0][0] ? existingRows[0][0] : null;

        if (!currentVenue) {
            throw new Error('Venue not found.');
        }

        const venue = {
            VenueID: venueData.VenueID ?? currentVenue.VenueID,
            VenueName: venueData.VenueName ?? currentVenue.VenueName,
            VenueAddress: venueData.VenueAddress ?? currentVenue.VenueAddress,
            SeatingRow: venueData.SeatingRow ?? currentVenue.SeatingRow,
            SeatingCol: venueData.SeatingCol ?? currentVenue.SeatingCol,
            VipRow: venueData.VipRow ?? currentVenue.VipRow ?? 0,
            VVipRow: venueData.VVipRow ?? currentVenue.VVipRow ?? 0
        };
        const isLayoutChanged = 
            currentVenue.SeatingRow !== venue.SeatingRow ||
            currentVenue.SeatingCol !== venue.SeatingCol ||
            (currentVenue.VipRow || 0) !== venue.VipRow ||
            (currentVenue.VVipRow || 0) !== venue.VVipRow;

        const connection = await this.db.getConnection();

        try {
            await connection.beginTransaction();

            await connection.query('CALL usp_Venue_Update(?, ?, ?, ?, ?)', [
                venue.VenueID,
                venue.VenueName,
                venue.VenueAddress,
                venue.SeatingRow,
                venue.SeatingCol
            ]);
            if (isLayoutChanged) {
                await connection.query('CALL usp_VenueSeat_DeleteByVenueID(?)', [venue.VenueID]);

                await connection.query('CALL usp_VenueSeat_GenerateVenueMap(?, ?, ?, ?, ?)', [
                    venue.VenueID,
                    venue.SeatingRow,
                    venue.SeatingCol,
                    venue.VVipRow, 
                    venue.VipRow   
                ]);
            }
            await connection.commit();
            return venue;
        } catch (error) {
            await connection.rollback();
            throw error;
        } finally {
            connection.release();
        }
    }

    async delete(venueId) {
        const connection = await this.db.getConnection();

        try {
            await connection.beginTransaction();
            await connection.query('CALL usp_VenueSeat_DeleteByVenueID(?)', [venueId]);
            await connection.query('CALL usp_Venue_Delete(?)', [venueId]);
            await connection.commit();
            return true;
        } catch (error) {
            await connection.rollback();
            throw error;
        } finally {
            connection.release();
        }
    }

    async getSeatsByVenueId(venueId) {
        const [rows] = await this.db.query('CALL usp_VenueSeat_GetByVenueID(?)', [venueId]);
        return rows[0] || [];
    }

    async updateSeatType(seatId, seatType) {
        await this.db.query('CALL usp_VenueSeat_UpdateType(?, ?)', [seatId, seatType]);
        return true;
    }
}

module.exports = VenueService;