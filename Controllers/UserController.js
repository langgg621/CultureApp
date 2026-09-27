const { UserService } = require('../Services');
const { ResponseUtil, IdGenerator, DateTimeUtil } = require('../Utils');
class UserController {
    constructor(db) {
        this.userService = new UserService(db);
    }

    async getByUserName(req, res) {
        try {
            const { username } = req.params;
            const user = await this.userService.getByUserName(username);
            if (!user) {
                return res.status(404).json({ success: false, message: 'User not found' });
            }
            return res.json({ success: true, data: user });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async register(req, res) {
        try {
            const newUser = await this.userService.insert(req.body);
            return res.status(201).json({ success: true, data: newUser });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }
    async login(req, res) {
        try {
            const { UserName, Password } = req.body;

            if (!UserName || !Password) {
                return ResponseUtil.error(res, 'The username and password must not be left blank.', 400);
            }

            const result = await this.userService.login(UserName, Password);
            return ResponseUtil.success(res, result, 'Login successful');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 400);
        }
    }
    async update(req, res) {
        try {
            const { id } = req.params;
            const userData = { ...req.body, UserID: id };
            const updatedUser = await this.userService.update(userData);
            return res.json({ success: true, data: updatedUser });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async changePassword(req, res) {
        try {
            const { id } = req.params;
            const { newPassword } = req.body;
            await this.userService.changePassword(id, newPassword);
            return res.json({ success: true, message: 'Password changed successfully.' });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }

    async deleteAccount(req, res) {
        try {
            const { id } = req.params;
            await this.userService.deleteAccount(id);
            return res.json({ success: true, message: 'Account successfully deleted.' });
        } catch (error) {
            return res.status(500).json({ success: false, message: error.message });
        }
    }
}

module.exports = UserController;