const { Category } = require('../Entities');
const { IdGenerator, DateTimeUtil } = require('../Utils');

class CategoryService {
    constructor(db) {
        this.db = db; 
    }

    async getAll(pageIndex, pageSize) {
        const [rows] = await this.db.query('CALL usp_Category_GetAll(?, ?)', [pageIndex, pageSize]);
        return rows[0] || [];
    }

    async getCategoryById(id) {
        const [rows] = await this.db.query('CALL usp_Category_GetByID(?)', [id]);
        return rows[0] && rows[0][0] ? rows[0][0] : null;
    }

    async createCategory(data) {
        const category = data instanceof Category ? data : new Category(data);    
        const [rows] = await this.db.query('CALL usp_Category_CheckExistName(?)', [category.Name]);
        const total = rows[0][0].Total;
        
        if (total > 0) {
            throw new Error('This category name already exists.');
        }

        await this.db.query('CALL usp_Category_Insert(?, ?, ?)', [
            category.CategoryID = IdGenerator.generateId(),
            category.Name,
            category.Description
        ]);

        return true;
    }

    async updateCategory(data) {
        const category = data instanceof Category ? data : new Category(data);
        await this.db.query('CALL usp_Category_Update(?, ?, ?, ?, ?)', [
            category.CategoryID,
            category.Name,
            category.Description,
            category.IsActive,
            category.UpdateDate = DateTimeUtil.toMySQLDateTime(Date.now())
        ]);
        return data;
    }

    async deleteCategory(id) {
        await this.db.query('CALL usp_Category_Delete(?)', [id]);
        return true;
    }
}

module.exports = CategoryService;