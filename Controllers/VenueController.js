const { VenueService } = require('../Services');
const { ResponseUtil } = require('../Utils');

class VenueController {
    constructor(db) {
        this.venueService = new VenueService(db);
    }

    async getAll(req, res) {
        try {
            const pageIndex = parseInt(req.query.pageIndex) || 1;
            const pageSize = parseInt(req.query.pageSize) || 10;
            const venues = await this.venueService.getAll(pageIndex, pageSize);
            return ResponseUtil.success(res, venues, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async getById(req, res) {
        try {
            const { id } = req.params;
            const venue = await this.venueService.getById(id);
            if (!venue) {
                return ResponseUtil.error(res, 'Venue not found', 404);
            }
            return ResponseUtil.success(res, venue, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async getSeatsByVenueId(req, res) {
        try {
            const { id } = req.params;
            const seats = await this.venueService.getSeatsByVenueId(id);
            return ResponseUtil.success(res, seats, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async getStats(req, res) {
        try {
            const { id } = req.params;
            const { startDate, endDate } = req.query;
            const stats = await this.venueService.getStats(id, startDate, endDate);
            return ResponseUtil.success(res, stats, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async create(req, res) {
        try {
            const newVenue = await this.venueService.insert(req.body);
            return ResponseUtil.success(res, newVenue, 'Venue created successfully', 201);
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async update(req, res) {
        try {
            const { id } = req.params;
            const venueData = { ...req.body, VenueID: id };
            const updatedVenue = await this.venueService.update(venueData);
            return ResponseUtil.success(res, updatedVenue, 'Venue updated successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async updateSeatType(req, res) {
        try {
            const { seatId } = req.params;
            const { seatType } = req.body;
            await this.venueService.updateSeatType(seatId, seatType);
            return ResponseUtil.success(res, null, 'Seat type updated successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async delete(req, res) {
        try {
            const { id } = req.params;
            await this.venueService.delete(id);
            return ResponseUtil.success(res, null, 'Venue deleted successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }
}

module.exports = VenueController;