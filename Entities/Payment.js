class Payment {
    constructor({
        PaymentID = null,
        BookingID = null,
        PaymentMethod = null,
        Status = 1, // 1: pending, 2: success, 3: failed, 4: refunded
        TransactionID = null,
        PaidAt = null,
        CreatedTime = null,
        CreatedTime_Tick = null,
        UpdateTime = null,
        UpdateTime_Tick = null,
        Amount = 0.00
    } = {}) {
        this.PaymentID = PaymentID;
        this.BookingID = BookingID;
        this.PaymentMethod = PaymentMethod;
        this.Status = Status;
        this.TransactionID = TransactionID;
        this.PaidAt = PaidAt;
        this.CreatedTime = CreatedTime;
        this.CreatedTime_Tick = CreatedTime_Tick;
        this.UpdateTime = UpdateTime;
        this.UpdateTime_Tick = UpdateTime_Tick;
        this.Amount = Amount;
    }

    toDatabaseRow() {
        return {
            PaymentID: this.PaymentID,
            BookingID: this.BookingID,
            PaymentMethod: this.PaymentMethod,
            Status: this.Status,
            TransactionID: this.TransactionID,
            PaidAt: this.PaidAt,
            CreatedTime: this.CreatedTime,
            CreatedTime_Tick: this.CreatedTime_Tick,
            UpdateTime: this.UpdateTime,
            UpdateTime_Tick: this.UpdateTime_Tick,
            Amount: this.Amount
        };
    }

    static fromDatabaseRow(row) {
        if (!row) return null;
        return new Payment({
            PaymentID: row.PaymentID,
            BookingID: row.BookingID,
            PaymentMethod: row.PaymentMethod,
            Status: row.Status,
            TransactionID: row.TransactionID,
            PaidAt: row.PaidAt,
            CreatedTime: row.CreatedTime,
            CreatedTime_Tick: row.CreatedTime_Tick,
            UpdateTime: row.UpdateTime,
            UpdateTime_Tick: row.UpdateTime_Tick,
            Amount: row.Amount
        });
    }
}

module.exports = Payment;