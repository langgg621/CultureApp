const { User } = require('../Entities');
const { HashUtil, IdGenerator, DateTimeUtil } = require('../Utils');
const jwt = require('jsonwebtoken');

class UserService {
    constructor(db) {
        this.db = db;
    }

    async getByUserName(userName) {
        const [rows] = await this.db.query('CALL usp_User_GetByUserName(?)', [userName]);
        if (rows[0] && rows[0][0]) {
            return User.fromDatabaseRow(rows[0][0]);
        }
        return null;
    }

    async insert(userData) {
        const user = userData instanceof User ? userData : new User(userData);
        
        const [checkUserRows] = await this.db.query('CALL usp_User_CheckExistUser(?)', [user.UserName]);
        const userCount = checkUserRows[0][0].Total;
        
        const [checkEmailRows] = await this.db.query('CALL usp_User_CheckEmail(?)', [user.Email]);
        const emailCount = checkEmailRows[0][0].Total;
        
        if (userCount > 0 || emailCount > 0) {
            throw new Error('Account already exists.');
        }

        if (user.Password) {
            user.Password = await HashUtil.hashPassword(user.Password);
        }

        const birthdayFormatted = user.Birthday ? DateTimeUtil.toMySQLDateTime(user.Birthday) : null;

        await this.db.query('CALL usp_User_Insert(?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            user.UserID = IdGenerator.generateId(),
            user.UserName,
            user.Password,
            user.FullName,
            user.Email,
            user.PhoneNumber,
            user.Role,
            birthdayFormatted,
            user.Sex
        ]);

        return true;
    }

    async login(userName, password) {
        const user = await this.getByUserName(userName);
        if (!user) {
            throw new Error('Incorrect userName or password.');
        }
        const isMatch = await HashUtil.comparePassword(password, user.Password);
        if (!isMatch) {
            throw new Error('Incorrect userName or password.');
        }

        const tokenPayload = {
            UserID: user.UserID,
            UserName: user.UserName,
            Role: user.Role
        };
        const token = jwt.sign(tokenPayload, process.env.JWT_SECRET || 'SECRET_KEY', {
            expiresIn: '1d'
        });
        delete user.Password;
        return { user, token };
    }

    async update(userData, userId) {
        const currentUser = await this.getById(userId);
        if (!currentUser) {
            throw new Error('Account does not exist for update.');
        }
        const inputUser = userData instanceof User ? userData : new User(userData);
        const updatedUser = {
            UserID: userId,
            UserName: inputUser.UserName || currentUser.UserName,
            FullName: inputUser.FullName || currentUser.FullName,
            PhoneNumber: inputUser.PhoneNumber || currentUser.PhoneNumber,
            Birthday: inputUser.Birthday ? DateTimeUtil.toMySQLDateTime(inputUser.Birthday) : (currentUser.Birthday ? DateTimeUtil.toMySQLDateTime(currentUser.Birthday) : null),
            Sex: inputUser.Sex !== undefined && inputUser.Sex !== null ? inputUser.Sex : currentUser.Sex,
        };
        await this.db.query('CALL usp_User_Update(?, ?, ?, ?, ?, ?)', [
            updatedUser.UserID,
            updatedUser.UserName,
            updatedUser.FullName,
            updatedUser.PhoneNumber,
            updatedUser.Birthday,
            updatedUser.Sex
        ]);

        return true;
    }

    async changePassword(userId, oldPassword, newPassword) {
        const user = await this.getById(userId);
        if (!user) {
            throw new Error('Account does not exist.');
        }
        const isMatch = await HashUtil.comparePassword(oldPassword, user.Password);
        if (!isMatch) {
            throw new Error('Incorrect old password.');
        }
        const hashedPassword = await HashUtil.hashPassword(newPassword);
        await this.db.query('CALL usp_User_ChangePassword(?, ?)', [userId, hashedPassword]);

        return true;
    }

    async deleteAccount(userId) {
        await this.db.query('CALL usp_User_DeleteAccount(?)', [userId]);
        return true;
    }

    async getAll(pageIndex, pageSize) {
        const [rows] = await this.db.query('CALL usp_User_GetAll(?, ?)', [pageIndex, pageSize]);
        return (rows[0] || []).map(row => User.fromDatabaseRow(row));
    }

    async getById(userId) {
        const [rows] = await this.db.query('CALL usp_User_GetByID(?)', [userId]);
        if (rows[0] && rows[0][0]) {
            return User.fromDatabaseRow(rows[0][0]);
        }
        return null;
    }

    async updateRole(userId, role) {
        await this.db.query('CALL usp_User_UpdateRole(?, ?)', [userId, role]);
        return true;
    }
}

module.exports = UserService;