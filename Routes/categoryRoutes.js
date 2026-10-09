const express = require('express');
const router = express.Router();
const CategoryController = require('../Controllers/CategoryController');
const { AuthMiddleware, ValidateMiddleware } = require('../Middlewares');

module.exports = (db) => {
    const categoryController = new CategoryController(db);
    router.use(AuthMiddleware.authenticateToken);

    router.get('/', (req, res) => categoryController.getAll(req, res));
    router.get('/:id', (req, res) => categoryController.getById(req, res));
    router.post('/', ValidateMiddleware.validateCategoryCreate, (req, res) => categoryController.create(req, res));
    router.put('/:id', (req, res) => categoryController.update(req, res));
    router.delete('/:id', (req, res) => categoryController.delete(req, res));

    return router;
};