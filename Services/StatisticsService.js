class StatisticsService {
    constructor(db) {
        this.db = db;
    }

    async getStatistics(startDate, endDate, venueId) {
        const connection = await this.db.getConnection();
        try {
            const [rows] = await connection.query('CALL usp_GetStatistics(?, ?, ?)', [
                startDate || null, 
                endDate || null, 
                venueId || null
            ]);
            return rows[0]?.[0] || { TotalEvents: 0, TotalSoldTickets: 0, TotalRevenue: 0 };
        } finally {
            connection.release();
        }
    }
}

module.exports = StatisticsService;