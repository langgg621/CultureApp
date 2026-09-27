class DateTimeUtil {
    // Chuyển JavaScript Date/Timestamp sang C# Ticks (1 Tick = 100ns từ 01/01/0001)
    static getTicks(date = new Date()) {
        const epochTicks = 621355968000000000n; // Ticks từ 0001-01-01 tới Epoch (1970-01-01)
        const ticksPerMillisecond = 10000n;
        const timeInMs = BigInt(new Date(date).getTime());
        return epochTicks + (timeInMs * ticksPerMillisecond);
    }

    // Chuyển Javascript Date thành chuỗi DATETIME chuẩn cho MySQL (YYYY-MM-DD HH:mm:ss)
    static toMySQLDateTime(date = new Date()) {
        const d = new Date(date);
        return d.toISOString().slice(0, 19).replace('T', ' ');
    }
}

module.exports = DateTimeUtil;