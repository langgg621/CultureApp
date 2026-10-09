class Venue {
    constructor({
        VenueID = null,
        VenueName = '',
        VenueAddress = '',
        Capacity = 0,
        SeatingRow = 0,
        SeatingCol = '',
        VipRow =0,
        VVipRow =0,
    } = {}) {
        this.VenueID = VenueID;
        this.VenueName = VenueName;
        this.VenueAddress = VenueAddress;
        this.Capacity = Capacity;
        this.SeatingRow = SeatingRow;
        this.SeatingCol = SeatingCol;
        this.VVipRow = VVipRow;
        this.VipRow = VipRow;
    }

    toDatabaseRow() {
        return {
            VenueID: this.VenueID,
            VenueName: this.VenueName,
            VenueAddress: this.VenueAddress,
            Capacity: this.Capacity,
            SeatingRow: this.SeatingRow,
            SeatingCol: this.SeatingCol,
            VVipRow: this.VVipRow,
            VipRow: this.VipRow
        };
    }

    static fromDatabaseRow(row) {
        if (!row) return null;
        return new Venue({
            VenueID: row.VenueID,
            VenueName: row.VenueName,
            VenueAddress: row.VenueAddress,
            Capacity: row.Capacity,
            SeatingRow: row.SeatingRow,
            SeatingCol: row.SeatingCol,
            VVipRow: row.VVipRow,
            VipRow: row.VipRow
        });
    }
}

module.exports = Venue;