const { User } = require('../Entities');
const { HashUtil, IdGenerator, ResponseUtil } = require('../Utils');
const jwt = require('jsonwebtoken');

class UserService {
    constructor(db) {
        this.db = db;
    }
    //getbyusername
    async getByUserName(userName) {
        const [rows] = await this.db.query('CALL usp_User_GetByUserName(?)', [userName]);
        if (rows[0] && rows[0][0]) {
            return User.fromDatabaseRow(rows[0][0]);
        }
        return null;
    }
    //register
    async insert(userData) {
        const user = userData instanceof User ? userData : new User(userData);
        // Check Username 
       const [checkUserRows] = await this.db.query('CALL usp_User_CheckExistUser(?)', [user.UserName]);
        const userCount = checkUserRows[0][0].Total;
        // Check Email
        const [checkEmailRows] = await this.db.query('CALL usp_User_CheckEmail(?)', [user.Email]);
        const emailCount = checkEmailRows[0][0].Total;
        if (userCount > 0 || emailCount > 0) {
            throw new Error('Account already exists.');
        }
        // Hash password
        if (user.Password) {
            user.Password = await HashUtil.hashPassword(user.Password);
        }
        await this.db.query('CALL usp_User_Insert(?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            user.UserID = IdGenerator.generateId(),
            user.UserName,
            user.Password,
            user.FullName,
            user.Email,
            user.PhoneNumber,
            user.Role,
            user.Birthday,
            user.Sex
        ]);

        return true;
    }
    //login
    async login(userName, password) {
        const user = await this.getByUserName(userName);
        if (!user) {
            throw new Error('Incorrect userName or password.');
        }
        const isMatch = await HashUtil.comparePassword(password, user.Password);
        if (!isMatch) {
            throw new Error('Incorrect userName or password.');
        }
        // create JWT Token
        const tokenPayload = {
            UserID: user.UserID,
            UserName: user.UserName,
            Role: user.Role
        };
        const token = jwt.sign(tokenPayload, process.env.JWT_SECRET, {
            expiresIn: '1d' // Token có hiệu lực 1 ngày
        });
        delete user.Password;
        return {
            user,
            token
        };
    }

    // Update
    async update(userData) {
        const user = userData instanceof User ? userData : new User(userData);

        // Check username
        const [checkUserRows] = await this.db.query('CALL usp_User_CheckExistUser(?)', [user.UserName]);
        const userCount = checkUserRows[0][0]['count(*)'] || checkUserRows[0][0]['COUNT(*)'];

        if (userCount === 0) {
            throw new Error('Account does not exist for update.');
        }

        await this.db.query('CALL usp_User_Update(?, ?, ?, ?, ?, ?, ?)', [
            user.UserID,
            user.UserName,
            user.FullName,
            user.PhoneNumber,
            user.Birthday,
            user.Sex,
            user.LastUpdate
        ]);

        return true;
    }

    async changePassword(userId, newPassword) {
        const hashedPassword = await HashUtil.hashPassword(newPassword);
        await this.db.query('CALL usp_User_ChangePassword(?, ?)', [userId, hashedPassword]);
        return true;
    }

    async deleteAccount(userId) {
        await this.db.query('CALL usp_User_DeleteAccount(?)', [userId]);
        return true;
    }
}

module.exports = UserService;