const AuthMiddleware = require('./authMiddleware');
const { errorHandler, notFoundHandler } = require('./errorMiddleware');
const ValidateMiddleware = require('./validateMiddleware');

module.exports = {
    AuthMiddleware,
    errorHandler,
    notFoundHandler,
    ValidateMiddleware
};