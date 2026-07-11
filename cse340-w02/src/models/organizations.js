const db = require('../database');

const getAllOrganizations = async () => {
  try {
    const query = 'SELECT * FROM organization ORDER BY name';
    const result = await db.query(query);
    return result.rows;
  } catch (error) {
    console.error('Error in getAllOrganizations:', error);
    throw error;
  }
};

module.exports = { getAllOrganizations };
