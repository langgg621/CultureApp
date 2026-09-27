class Ticket {
    constructor({
        TicketID = null,
        EventID = null,
        SeatRow = '',
        SeatNumber = '',
        Price = 0,
        Status = 1, // 1: free, 2: reserved, 3: sold
        BookingID = null
    } = {}) {
        this.TicketID = TicketID;
        this.EventID = EventID;
        this.SeatRow = SeatRow;
        this.SeatNumber = SeatNumber;
        this.Price = Price;
        this.Status = Status;
        this.BookingID = BookingID;
    }

    toDatabaseRow() {
        return {
            TicketID: this.TicketID,
            EventID: this.EventID,
            SeatRow: this.SeatRow,
            SeatNumber: this.SeatNumber,
            Price: this.Price,
            Status: this.Status,
            BookingID: this.BookingID
        };
    }

    static fromDatabaseRow(row) {
        if (!row) return null;
        return new Ticket({
            TicketID: row.TicketID,
            EventID: row.EventID,
            SeatRow: row.SeatRow,
            SeatNumber: row.SeatNumber,
            Price: row.Price,
            Status: row.Status,
            BookingID: row.BookingID
        });
    }
}

module.exports = Ticket;