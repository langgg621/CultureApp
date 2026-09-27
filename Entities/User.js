class User{
    constructor({
        UserID,
        UserName,
        Password,
        FullName,
        Email,
        PhoneNumber,
        Role,
        Birthday,
        Sex,
        CreateDate,
        UpdateDate
    }){
        this.UserID = UserID;
        this.UserName = UserName;
        this.Password = Password;
        this.FullName = FullName;
        this.Email = Email;
        this.PhoneNumber =PhoneNumber;
        this.Role = Role;
        this.Birthday = Birthday;
        this.Sex = Sex;
        this.CreateDate = CreateDate;
        this.UpdateDate = UpdateDate;
    }

// object -> Plain obj (INSERT/UPDATE to MySQL)\
toDatabaseRow(){
    return{
        UserID: this.UserID,
        UserName: this.UserName,
        Password: this.Password,
        FullName: this.FullName,
        Email: this.Email,
        PhoneNumber: this.PhoneNumber,
        Role: this.Role,
        Birthday: this.Birthday,
        Sex: this.Sex,
        CreateDate: this.CreateDate,
        UpdateDate: this.UpdateDate
    }
}
static fromDatabaseRow(row) {
        return new User({
            UserID: row.UserID,
            UserName: row.UserName,
            Password: row.Password,
            FullName: row.FullName,
            Email: row.Email,
            PhoneNumber: row.PhoneNumber,
            Role: row.Role,
            Birthday: row.Birthday,
            Sex: row.Sex,
            CreateDate: row.CreateDate,
            UpdateDate: row.UpdateDate
        });
    }
}

module.exports = User;