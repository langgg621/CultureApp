class Booking {
    constructor({
        BookingID = null,
        EventID = null,
        UserID = null,
        CreateDate = null,
        CreateDate_Tick = null,
        UpdateDate = null,
        Updatedate_Tick = null,
        ExpiredAt = null,
        Status = 1, // 1: pending, 2: confirmed, 3: cancelled
        BookingCode = ''
    } = {}) {
        this.BookingID = BookingID;
        this.EventID = EventID;
        this.UserID = UserID;
        this.CreateDate = CreateDate;
        this.CreateDate_Tick = CreateDate_Tick;
        this.UpdateDate = UpdateDate;
        this.Updatedate_Tick = Updatedate_Tick;
        this.ExpiredAt = ExpiredAt;
        this.Status = Status;
        this.BookingCode = BookingCode;
    }

    toDatabaseRow() {
        return {
            BookingID: this.BookingID,
            EventID: this.EventID,
            UserID: this.UserID,
            CreateDate: this.CreateDate,
            CreateDate_Tick: this.CreateDate_Tick,
            UpdateDate: this.UpdateDate,
            Updatedate_Tick: this.Updatedate_Tick,
            ExpiredAt: this.ExpiredAt,
            Status: this.Status,
            BookingCode: this.BookingCode
        };
    }

    static fromDatabaseRow(row) {
        if (!row) return null;
        return new Booking({
            BookingID: row.BookingID,
            EventID: row.EventID,
            UserID: row.UserID,
            CreateDate: row.CreateDate,
            CreateDate_Tick: row.CreateDate_Tick,
            UpdateDate: row.UpdateDate,
            Updatedate_Tick: row.Updatedate_Tick,
            ExpiredAt: row.ExpiredAt,
            Status: row.Status,
            BookingCode: row.BookingCode
        });
    }
}

module.exports = Booking;