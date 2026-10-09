class DateTimeUtil {
    /**
     * Chuyển đổi Javascript Date/String/Number thành chuỗi DATETIME MySQL (YYYY-MM-DD HH:mm:ss)
     * Giữ nguyên múi giờ địa phương (Local Timezone).
     */
    static toMySQLDateTime(date = new Date()) {
        if (!date) return null;

        const d = new Date(date);
        
        // Kiểm tra xem date có hợp lệ hay không
        if (isNaN(d.getTime())) {
            return null;
        }

        const pad = (num) => String(num).padStart(2, '0');

        const year = d.getFullYear();
        const month = pad(d.getMonth() + 1);
        const day = pad(d.getDate());
        const hours = pad(d.getHours());
        const minutes = pad(d.getMinutes());
        const seconds = pad(d.getSeconds());

        return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    }

    /**
     * Lấy Ticks (Miliseconds) phục vụ các trường _Tick
     */
    static getTicks(date = new Date()) {
        const d = new Date(date);
        return isNaN(d.getTime()) ? Date.now() : d.getTime();
    }
}

module.exports = DateTimeUtil;