const express = require('express');
const router = express.Router();
const { TicketController } = require('../Controllers');
const { AuthMiddleware, ValidateMiddleware } = require('../Middlewares');

module.exports = (db) => {
    const ticketController = new TicketController(db);
    router.use(AuthMiddleware.authenticateToken);
    

    router.get('/event/:eventId', (req, res) => ticketController.getByEventId(req, res));
    router.get('/:id', (req, res) => ticketController.getById(req, res));
    router.post('/', (req, res) => ticketController.create(req, res));
    router.put('/:id', (req, res) => ticketController.update(req, res));
    router.patch('/:id/status', (req, res) => ticketController.updateStatus(req, res));
    router.delete('/:id', (req, res) => ticketController.delete(req, res));

    return router;
};