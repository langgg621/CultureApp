const { ResponseUtil } = require('../Utils');

class ValidateMiddleware {
    // Kiểm tra dữ liệu đăng ký User
    static validateUserRegister(req, res, next) {
        const { UserName, Password, Email,Role, PhoneNumber } = req.body;

        if (!UserName || !Password || !Email || !Role) {
            return ResponseUtil.error(res, 'Please fill in your username, password, email and role.', 400);
        }

        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(Email)) {
            return ResponseUtil.error(res, 'Invalid email format', 400);
        }

        if (Password.length < 6) {
            return ResponseUtil.error(res, 'The password must be at least 6 characters long.', 400);
        }
        const phoneRegex = /^\d{9,12}$/;
        if (!phoneRegex.test(String(PhoneNumber))) {
            return ResponseUtil.error(res, 'The phone number must be between 9 and 12 characters long and contain only digits.', 400);
        }
        next();
    }

    // Kiểm tra dữ liệu Đặt vé (Booking)
    static validateBookingCreate(req, res, next) {
        const { EventID, UserID } = req.body;

        if (!EventID || !UserID) {
            return ResponseUtil.error(res, 'Thiếu thông tin EventID hoặc UserID', 400);
        }

        next();
    }
}

module.exports = ValidateMiddleware;