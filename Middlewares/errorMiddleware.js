const { ResponseUtil } = require('../Utils');

// Middleware bắt các lỗi không mong muốn trong ứng dụng
const errorHandler = (err, req, res, next) => {
    console.error('Server Error:', err.stack);

    const statusCode = err.statusCode || 500;
    const message = err.message || 'System Error';

    return ResponseUtil.error(res, message, statusCode, process.env.NODE_ENV === 'development' ? err.stack : null);
};

// Middleware xử lý 404 Not Found khi gọi sai Route
const notFoundHandler = (req, res) => {
    return ResponseUtil.error(res, `Route not found: ${req.originalUrl}`, 404);
};

module.exports = {
    errorHandler,
    notFoundHandler
};