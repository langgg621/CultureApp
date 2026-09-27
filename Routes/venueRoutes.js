const express = require('express');
const router = express.Router();
const { VenueController } = require('../Controllers');

module.exports = (db) => {
    const venueController = new VenueController(db);

    router.get('/', (req, res) => venueController.getAll(req, res));
    router.get('/:id/stats', (req, res) => venueController.getStats(req, res));
    router.get('/:id', (req, res) => venueController.getById(req, res));
    router.post('/', (req, res) => venueController.create(req, res));
    router.put('/:id', (req, res) => venueController.update(req, res));
    router.delete('/:id', (req, res) => venueController.delete(req, res));

    return router;
};