const { CategoryService } = require('../Services');
const { ResponseUtil } = require('../Utils');

class CategoryController {
    constructor(db) {
        this.categoryService = new CategoryService(db);
    }

    async getAll(req, res) {
        try {
            const pageIndex = parseInt(req.query.pageIndex) || 1;
            const pageSize = parseInt(req.query.pageSize) || 10;
            const categories = await this.categoryService.getAll(pageIndex, pageSize);
            return ResponseUtil.success(res, categories, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async getById(req, res) {
        try {
            const { id } = req.params;
            const category = await this.categoryService.getCategoryById(id);
            if (!category) {
                return ResponseUtil.error(res, 'Category not found', 404);
            }
            return ResponseUtil.success(res, category, 'Success');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async create(req, res) {
        try {
            await this.categoryService.createCategory(req.body);
            return ResponseUtil.success(res, null, 'Category created successfully', 201);
        } catch (error) {
            const statusCode = error.message.includes('already exists') ? 400 : 500;
            return ResponseUtil.error(res, error.message, statusCode);
        }
    }

    async update(req, res) {
        try {
            const { id } = req.params;
            const data = {
                ...req.body,
                CategoryID: id,
                UpdateDate: new Date()
            };

            const updatedCategory = await this.categoryService.updateCategory(data);
            return ResponseUtil.success(res, updatedCategory, 'Category updated successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }

    async delete(req, res) {
        try {
            const { id } = req.params;
            await this.categoryService.deleteCategory(id);
            return ResponseUtil.success(res, null, 'Category deleted successfully');
        } catch (error) {
            return ResponseUtil.error(res, error.message, 500);
        }
    }
}

module.exports = CategoryController;