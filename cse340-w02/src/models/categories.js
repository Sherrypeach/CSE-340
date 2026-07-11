const db = require('../database');

const getAllCategories = async () => {
  try {
    const query = 'SELECT * FROM categories ORDER BY name';
    const result = await db.query(query);
    return result.rows;
  } catch (error) {
    console.error('Error in getAllCategories:', error);
    throw error;
  }
};

module.exports = { getAllCategories };
