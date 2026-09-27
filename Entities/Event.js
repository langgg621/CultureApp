class Event {
    constructor({
        EventID = null,
        EventName = '',
        Description = '',
        CategoryID = null,
        VenueID = null,
        EventDate = null,
        EventDate_Tick = null,
        CreateDate = null,
        UpdateDate = null,
        CreateDate_Tick = null,
        UpdateDate_Tick = null,
        Status = null
    } = {}) {
        this.EventID = EventID;
        this.EventName = EventName;
        this.Description = Description;
        this.CategoryID = CategoryID;
        this.VenueID = VenueID;
        this.EventDate = EventDate;
        this.EventDate_Tick = EventDate_Tick;
        this.CreateDate = CreateDate;
        this.UpdateDate = UpdateDate;
        this.CreateDate_Tick = CreateDate_Tick;
        this.UpdateDate_Tick = UpdateDate_Tick;
        this.Status = Status;
    }

    toDatabaseRow() {
        return {
            EventID: this.EventID,
            EventName: this.EventName,
            Description: this.Description,
            CategoryID: this.CategoryID,
            VenueID: this.VenueID,
            EventDate: this.EventDate,
            EventDate_Tick: this.EventDate_Tick,
            CreateDate: this.CreateDate,
            UpdateDate: this.UpdateDate,
            CreateDate_Tick: this.CreateDate_Tick,
            UpdateDate_Tick: this.UpdateDate_Tick,
            Status: this.Status
        };
    }

    static fromDatabaseRow(row) {
        if (!row) return null;
        return new Event({
            EventID: row.EventID,
            EventName: row.EventName,
            Description: row.Description,
            CategoryID: row.CategoryID,
            VenueID: row.VenueID,
            EventDate: row.EventDate,
            EventDate_Tick: row.EventDate_Tick,
            CreateDate: row.CreateDate,
            UpdateDate: row.UpdateDate,
            CreateDate_Tick: row.CreateDate_Tick,
            UpdateDate_Tick: row.UpdateDate_Tick,
            Status: row.Status
        });
    }
}

module.exports = Event;