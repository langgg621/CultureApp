const StatisticsService = require('../Services/StatisticsService');
const { ResponseUtil } = require('../Utils');
class StatisticsController {
    constructor(db) {
        this.statisticsService = new StatisticsService(db);
    }

    async getStats(req, res) {
        try {
            const { startDate, endDate, venueId } = req.query;
            const stats = await this.statisticsService.getStatistics(startDate, endDate, venueId);
            if(!stats){
                return ResponseUtil.error(res, 'Statistics not found', 404);
            }
            return ResponseUtil.success(res, stats, 'Statistics retrieved successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }
}

module.exports = StatisticsController;