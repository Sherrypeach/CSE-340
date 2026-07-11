const db = require('../database');

const getAllProjects = async () => {
  try {
    const query = 'SELECT * FROM project ORDER BY project_date';
    const result = await db.query(query);
    return result.rows;
  } catch (error) {
    console.error('Error in getAllProjects:', error);
    throw error;
  }
};

module.exports = { getAllProjects };
