const express = require('express');
const router = express.Router();
const { UserController } = require('../Controllers');
const { AuthMiddleware, ValidateMiddleware } = require('../Middlewares');

module.exports = (db) => {
    const controller = new UserController(db);

    // Public Routes
    router.post('/register', ValidateMiddleware.validateUserRegister, (req, res) => controller.register(req, res));
    router.post('/login', (req, res) => controller.login(req, res));

    router.use(AuthMiddleware.authenticateToken);

    router.put('/:id', (req, res) => controller.update(req, res));
    router.patch('/:id/change-password', (req, res) => controller.changePassword(req, res));

    router.get('/', (req, res) => controller.getAll(req, res));
    router.get('/id/:id', (req, res) => controller.getById(req, res));

    // Admin Routes
    router.patch('/:id/role', AuthMiddleware.authorizeRoles(3), (req, res) => controller.updateRole(req, res));
    router.delete('/:id', AuthMiddleware.authorizeRoles(3), (req, res) => controller.deleteAccount(req, res));

    return router;
};