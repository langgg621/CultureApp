class DateTimeUtil {

    // convert Javascript Date to DATETIME MySQL (YYYY-MM-DD HH:mm:ss)
    static toMySQLDateTime(date = new Date()) {
        const d = new Date(date);
        return d.toISOString().slice(0, 19).replace('T', ' ');
    }
}

module.exports = DateTimeUtil;