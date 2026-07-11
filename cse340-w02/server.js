require('dotenv').config();
const express = require('express');
const path = require('path');

const { getAllOrganizations } = require('./src/models/organizations');
const { getAllProjects } = require('./src/models/projects');
const { getAllCategories } = require('./src/models/categories');

const app = express();
const PORT = process.env.PORT || 3000;

// View engine setup
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'src/views'));

// Static files (CSS, images, etc.)
app.use(express.static(path.join(__dirname, 'public')));

// Home page
app.get('/', (req, res) => {
  res.render('index');
});

// Organizations route
app.get('/organizations', async (req, res) => {
  try {
    const organizations = await getAllOrganizations();
    res.render('organizations', { organizations: organizations });
  } catch (error) {
    console.error('Error loading organizations:', error);
    res.status(500).send('Error loading organizations.');
  }
});

// Projects route
app.get('/projects', async (req, res) => {
  try {
    const projects = await getAllProjects();
    res.render('projects', { projects: projects });
  } catch (error) {
    console.error('Error loading projects:', error);
    res.status(500).send('Error loading projects.');
  }
});

// Categories route
app.get('/categories', async (req, res) => {
  try {
    const categories = await getAllCategories();
    res.render('categories', { categories: categories });
  } catch (error) {
    console.error('Error loading categories:', error);
    res.status(500).send('Error loading categories.');
  }
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
