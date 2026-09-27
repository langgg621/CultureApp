const jwt = require('jsonwebtoken');
const { ResponseUtil } = require('../Utils');
require('dotenv').config();

const JWT_SECRET = process.env.JWT_SECRET;

class AuthMiddleware {
    // 1. Kiểm tra Token hợp lệ (Authentication)
    static authenticateToken(req, res, next) {
        const authHeader = req.headers['authorization'];
        const token = authHeader && authHeader.split(' ')[1]; // Format: Bearer <TOKEN>

        if (!token) {
            return ResponseUtil.error(res, 'Unauthorized', 401);
        }

        jwt.verify(token, JWT_SECRET, (err, user) => {
            if (err) {
                return ResponseUtil.error(res, 'Token không hợp lệ hoặc đã hết hạn (Forbidden)', 403);
            }
            req.user = user; // Gán thông tin user vào request
            next();
        });
    }

    // 2. Phân quyền theo Role (1: Customer, 2: Organizer, 3: Admin)
    static authorizeRoles(...allowedRoles) {
        return (req, res, next) => {
            if (!req.user || !allowedRoles.includes(req.user.Role)) {
                return ResponseUtil.error(res, 'Bạn không có quyền truy cập tính năng này', 403);
            }
            next();
        };
    }
}

module.exports = AuthMiddleware;