const bcrypt = require('bcryptjs');

class HashUtil {
    // Băm mật khẩu trước khi lưu vào database
    static async hashPassword(password) {
        const salt = await bcrypt.genSalt(10);
        return await bcrypt.hash(password, salt);
    }

    // So sánh mật khẩu nhập vào với chuỗi hash trong DB
    static async comparePassword(password, hashedPassword) {
        return await bcrypt.compare(password, hashedPassword);
    }
}

module.exports = HashUtil;