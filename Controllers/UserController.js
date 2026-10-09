const { UserService } = require('../Services');
const { ResponseUtil } = require('../Utils');

class UserController {
    constructor(db) {
        this.userService = new UserService(db);
    }

    async getAll(req, res) {
        try {
            const pageIndex = parseInt(req.query.pageIndex) || 1;
            const pageSize = parseInt(req.query.pageSize) || 10;
            const users = await this.userService.getAll(pageIndex, pageSize);
            return ResponseUtil.success(res, users, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async getById(req, res) {
        try {
            const { id } = req.params;
            const user = await this.userService.getById(id);
            if (!user) {
                return ResponseUtil.error(res, 'User not found', 404);
            }
            return ResponseUtil.success(res, user, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async register(req, res) {
        try {
            const newUser = await this.userService.insert(req.body);
            return ResponseUtil.success(res, newUser, 'User registered successfully', 201);
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async login(req, res) {
        try {
            const { UserName, Password } = req.body;

            if (!UserName || !Password) {
                return ResponseUtil.error(res, 'Username and password cannot be blank.', 400);
            }

            const result = await this.userService.login(UserName, Password);
            return ResponseUtil.success(res, result, 'Login successful');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 400);
        }
    }

    async update(req, res) {
        try {
            const updatedUser = await this.userService.update(req.body, req.user.UserID);
            return ResponseUtil.success(res, updatedUser, 'User updated successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async updateRole(req, res) {
        try {
            const { id } = req.params;
            const { role } = req.body;
            await this.userService.updateRole(id, role);
            return ResponseUtil.success(res, null, 'User role updated successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async changePassword(req, res) {
        try {
            const { oldPassword, newPassword } = req.body;

            if (!oldPassword || !newPassword) {
                return ResponseUtil.error(res, 'Both old and new passwords are required.', 400);
            }

            await this.userService.changePassword(req.user.UserID, oldPassword, newPassword);
            return ResponseUtil.success(res, null, 'Password changed successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 400);
        }
    }

    async deleteAccount(req, res) {
        try {
            const { id } = req.params;
            await this.userService.deleteAccount(id);
            return ResponseUtil.success(res, null, 'Account deleted successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }
}

module.exports = UserController;