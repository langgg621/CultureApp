const { v4: uuidv4 } = require('uuid');

class IdGenerator {
    // Tạo GUID/UUID v4 khớp với kiểu dữ liệu char(36) trong MySQL
    static generateId() {
        return uuidv4();
    }

    // Tạo mã Booking Code ngẫu nhiên (ví dụ: BK-8F32A)
    static generateBookingCode(prefix = 'BK') {
        const randomStr = Math.random().toString(36).substring(2, 8).toUpperCase();
        return `${prefix}-${randomStr}`;
    }
}

module.exports = IdGenerator;