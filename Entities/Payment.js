class Payment {
    constructor({
        PaymentID = null,
        BookingID = null,
        PaymentMethod = null,
        Status = 1, // 1: pending, 2: success, 3: failed, 4: refunded
        TransactionID = null,
        PaidAt = null,
        CreatedTime = null,
        UpdateTime = null,
        Amount = 0.00
    } = {}) {
        this.PaymentID = PaymentID;
        this.BookingID = BookingID;
        this.PaymentMethod = PaymentMethod;
        this.Status = Status;
        this.TransactionID = TransactionID;
        this.PaidAt = PaidAt;
        this.CreatedTime = CreatedTime;
        this.UpdateTime = UpdateTime;
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
            UpdateTime: this.UpdateTime,
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
            UpdateTime: row.UpdateTime,
            Amount: row.Amount
        });
    }
}

module.exports = Payment;