const express = require('express');
const router = express.Router();
const { StatisticsController } = require('../Controllers');

module.exports = (db) => {
    const statisticsController = new StatisticsController(db);
    
    // Sửa getStatistics thành getStats cho khớp với Controller
    router.get('/', (req, res) => statisticsController.getStats(req, res));

    return router;
};