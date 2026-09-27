const express = require('express');
const router = express.Router();
const { UserController } = require('../Controllers');
const { AuthMiddleware, ValidateMiddleware } = require('../Middlewares');

module.exports = (db) => {
    const controller = new UserController(db);

    router.post('/register', ValidateMiddleware.validateUserRegister, (req, res) => controller.register(req, res));
    router.post('/login', (req, res) => controller.login(req, res));

    router.get('/:username', AuthMiddleware.authenticateToken, (req, res) => controller.getByUserName(req, res));
    router.put('/:id', AuthMiddleware.authenticateToken, (req, res) => controller.update(req, res));    //Update
    router.patch('/:id/change-password', AuthMiddleware.authenticateToken, (req, res) => controller.changePassword(req, res));
    
    // Route for Admin (Role = 3)
    router.delete('/:id', AuthMiddleware.authenticateToken, AuthMiddleware.authorizeRoles(3), (req, res) => controller.deleteAccount(req, res));

    return router;
};