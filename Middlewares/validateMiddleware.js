const { ResponseUtil } = require('../Utils');

class ValidateMiddleware {
    // 1. Validate RegisterUser
    static validateUserRegister(req, res, next) {
        const { UserName, Password, Email,Role, PhoneNumber } = req.body;

        if (!UserName || !Password || !Email || !Role) {
            return ResponseUtil.error(res, 'Please fill in your username, password, email and role.', 400);
        }

        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(Email)) {
            return ResponseUtil.error(res, 'Invalid email format', 400);
        }

        if (Password.length < 6) {
            return ResponseUtil.error(res, 'The password must be at least 6 characters long.', 400);
        }
        const phoneRegex = /^\d{9,12}$/;
        if (!phoneRegex.test(String(PhoneNumber))) {
            return ResponseUtil.error(res, 'The phone number must be between 9 and 12 characters long and contain only digits.', 400);
        }
        next();
    }
    // 2. Validate Venue Create
    static validateVenueInsert(req, res, next) {
        const { VenueName, VenueAddress, Capacity, SeatingRow, SeatingCol } = req.body;
        if (
            !VenueName || String(VenueName).trim() === '' ||
            !VenueAddress || String(VenueAddress).trim() === '' ||
            Capacity === undefined || Capacity === null ||
            SeatingRow === undefined || SeatingRow === null ||
            SeatingCol === undefined || SeatingCol === null
        ) {
            return ResponseUtil.error(
                res, 
                'Please provide all required fields: VenueName, VenueAddress, Capacity, SeatingRow, and SeatingCol.', 
                400
            );
        }
        if (isNaN(Capacity) || Number(Capacity) <= 0) {
            return ResponseUtil.error(res, 'Capacity must be a number greater than 0.', 400);
        }
        if (isNaN(SeatingRow) || Number(SeatingRow) <= 0) {
            return ResponseUtil.error(res, 'SeatingRow must be a number greater than 0.', 400);
        }
        if (isNaN(SeatingCol) || Number(SeatingCol) <= 0) {
            return ResponseUtil.error(res, 'SeatingCol must be a number greater than 0.', 400);
        }
        next();
    }
    //3. Event Validate
    static validateEventCreate(req, res, next) {
        const { EventName, Description, VenueID, EventDate } = req.body;

        if (!EventName?.trim() || !Description?.trim() || !VenueID || !EventDate) {
            return res.status(400).json({ 
                message: "None of the information (EventName, Description, VenueID, EventDate) may be left blank." 
            });
        }

        next();
    }
    //4. Category Validate
    static validateCategoryCreate(req, res, next) {
        const { Name, Description } = req.body;

        // Kiểm tra null / undefined / rỗng
        if (!Name || !Name.trim()) {
            return res.status(400).json({
                message: 'Name cannot null'
            });
        }

        if (Name.trim().length > 100) {
            return res.status(400).json({
                message: 'The name must not exceed 100 characters.'
            });
        }
        req.body.Name = Name.trim();
        if (Description) req.body.Description = Description.trim();

        next();
    }
    static validateBookingCreate(req, res, next) {
        const { EventID, UserID } = req.body;
        if (!EventID || !UserID) {
            return ResponseUtil.error(res, 'Missing EventID or UserID information.', 400);
        }
        next();
    }
}

module.exports = ValidateMiddleware;