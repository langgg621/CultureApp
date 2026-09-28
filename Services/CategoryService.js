const { Category } = require('../Entities');
const { HashUtil, IdGenerator, ResponseUtil } = require('../Utils');
class CategoryService {
    constructor(db) {
        this.db = db; 
    }
    async getAll(pageIndex = 1, pageSize = 10) {
        const [rows] = await this.db.query('CALL usp_Category_GetAll(?, ?)', [pageIndex, pageSize]);
        return rows[0] || [];
    }

    async getCategoryById(id) {
        const rows = await this.db.query('CALL usp_Category_GetByID(?)', id);
        return row[0] && rows[0][0] ? rows[0][0] : null;
    }
    async createCategory(data) {
        const category = data instanceof Category ? data : new Category(data);    
        const [rows] = await this.db.query('CALL usp_Category_CheckExistName(?)', category.Name );
        const total = rows[0][0].Total;
        if (total >0) {
            throw new Error('This category name already exists.');
        }
        await this.db.query(' CALL usp_Category_Insert(?,?,?)',[
            data.CategoryID = IdGenerator.generateId(),
            data.Name,
            data.Description
        ]);

        return true;
    }

    async updateCategory(data) {
        const category = data instanceof Category ? data:new Category(data);
        await this.db.query('CALL usp_Category_Update(?,?,?,?,?)',[
            data.CategoryID,
            data.Name,
            data.Description,
            data.IsActive,
            data.UpdateDate
        ]);
        return data;
    }
    async deleteCategory(id) {
        await this.db.query('CALL usp_Category_Delete(?)', [id]);
        return true;
    }
}

module.exports = CategoryService;