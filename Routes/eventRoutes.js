const express = require('express');
const router = express.Router();
const { EventController } = require('../Controllers');

module.exports = (db) => {
    const eventController = new EventController(db);

    router.get('/', (req, res) => eventController.getAll(req, res));
    router.get('/search', (req, res) => eventController.search(req, res));
    router.get('/:id', (req, res) => eventController.getById(req, res));
    router.post('/', (req, res) => eventController.create(req, res));
    router.put('/:id', (req, res) => eventController.update(req, res));
    router.delete('/:id', (req, res) => eventController.delete(req, res));

    return router;
};