const { VenueService } = require('../Services');

class VenueController {
    constructor(db) {
        this.venueService = new VenueService(db);
    }

    async getAll(req, res) {
        try {
            const pageIndex = parseInt(req.query.pageIndex) || 1;
            const pageSize = parseInt(req.query.pageSize) || 10;
            const venues = await this.venueService.getAll(pageIndex, pageSize);
            return res.json({ success: true, data: venues });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async getById(req, res) {
        try {
            const { id } = req.params;
            const venue = await this.venueService.getById(id);
            if (!venue) {
                return res.status(404).json({ success: false, message: 'Không tìm thấy địa điểm' });
            }
            return res.json({ success: true, data: venue });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async getStats(req, res) {
        try {
            const { id } = req.params;
            const { startDate, endDate } = req.query;
            const stats = await this.venueService.getStats(id, startDate, endDate);
            return res.json({ success: true, data: stats });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async create(req, res) {
        try {
            const newVenue = await this.venueService.insert(req.body);
            return res.status(201).json({ success: true, data: newVenue });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async update(req, res) {
        try {
            const { id } = req.params;
            const venueData = { ...req.body, VenueID: id };
            const updatedVenue = await this.venueService.update(venueData);
            return res.json({ success: true, data: updatedVenue });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async delete(req, res) {
        try {
            const { id } = req.params;
            await this.venueService.delete(id);
            return res.json({ success: true, message: 'Xóa địa điểm thành công' });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }
}

module.exports = VenueController;