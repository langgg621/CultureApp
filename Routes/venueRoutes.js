const express = require('express');
const router = express.Router();
const { VenueController } = require('../Controllers');
const { AuthMiddleware, ValidateMiddleware } = require('../Middlewares');

module.exports = (db) => {
    const venueController = new VenueController(db);

    router.use(AuthMiddleware.authenticateToken);

    router.get('/getall', (req, res) => venueController.getAll(req, res));
    router.get('/:id/time', (req, res) => venueController.getStats(req, res));
    router.get('/:id', (req, res) => venueController.getById(req, res));
    router.post('/insert', ValidateMiddleware.validateVenueInsert, (req, res) => venueController.create(req, res));
    router.put('/:id', (req, res) => venueController.update(req, res));


    return router;
};
