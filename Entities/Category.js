class Category {
    constructor({
        CategoryID,
        Name,
        IsActive,
        Description ,
        CreateDate, 
        UpdateDate 
    } = {}) {
        this.CategoryID = CategoryID;
        this.Name = Name;
        this.IsActive = IsActive;
        this.Description = Description;
        this.CreateDate = CreateDate;
        this.UpdateDate = UpdateDate;
    }

    toDatabaseRow() {
        return {
            CategoryID: this.CategoryID,
            Name: this.Name,
            IsActive: this.IsActive,
            Description: this.Description,
            CreateDate: this.CreateDate,
            UpdateDate: this.UpdateDate
        };
    }

    static fromDatabaseRow(row) {
        if (!row) return null;
        return new Category({
            CategoryID: row.CategoryID,
            Name: row.Name,
            IsActive: row.IsActive,
            Description: row.Description,
            CreateDate:row.CreateDate,
            UpdateDate: row.UpdateDate
        });
    }
}

module.exports = Category;