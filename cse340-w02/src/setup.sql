-- =========================================================
-- CSE 340 W02 Assignment: Database Retrieval
-- setup.sql
-- Run this file against your database to (re)create all
-- tables and seed data for organizations, projects, and
-- categories.
-- =========================================================

-- Drop tables if they already exist (order matters because
-- of foreign key dependencies).
DROP TABLE IF EXISTS project_categories;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS organization;

-- =========================================================
-- ORGANIZATIONS
-- =========================================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    website VARCHAR(255)
);

INSERT INTO organization (name, description, website) VALUES
('Helping Hands Utah', 'Local nonprofit focused on food security and family support.', 'https://helpinghandsutah.org'),
('Green Future Coalition', 'Community group organizing environmental cleanup and education events.', 'https://greenfuturecoalition.org'),
('Bright Path Literacy', 'Volunteer organization providing free tutoring and literacy programs.', 'https://brightpathliteracy.org');

-- =========================================================
-- PROJECTS
-- Each project belongs to one organization (foreign key).
-- =========================================================
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES organization(organization_id),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    project_date DATE
);

INSERT INTO project (organization_id, name, description, project_date) VALUES
(1, 'Community Food Drive', 'Collecting and distributing non-perishable food to local families.', '2026-08-15'),
(1, 'Back to School Supply Packs', 'Assembling backpacks with school supplies for children in need.', '2026-08-22'),
(2, 'River Cleanup Day', 'Volunteers clean litter and debris along the local riverbank.', '2026-09-05'),
(2, 'Native Tree Planting', 'Planting native trees in public parks to support local ecosystems.', '2026-09-19'),
(3, 'Weekend Reading Buddies', 'Volunteers read with elementary students to build literacy skills.', '2026-10-03');

-- =========================================================
-- CATEGORIES
-- Each category has a unique id and name.
-- =========================================================
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO categories (name) VALUES
('Food Security'),
('Environment'),
('Education');

-- =========================================================
-- PROJECT_CATEGORIES (junction table)
-- A project can belong to one or more categories, and a
-- category can be associated with one or more projects
-- (many-to-many relationship).
-- =========================================================
CREATE TABLE project_categories (
    project_id INTEGER NOT NULL REFERENCES project(project_id),
    category_id INTEGER NOT NULL REFERENCES categories(category_id),
    PRIMARY KEY (project_id, category_id)
);

-- Associate each project with at least one category.
INSERT INTO project_categories (project_id, category_id) VALUES
(1, 1), -- Community Food Drive -> Food Security
(2, 1), -- Back to School Supply Packs -> Food Security
(2, 3), -- Back to School Supply Packs -> Education
(3, 2), -- River Cleanup Day -> Environment
(4, 2), -- Native Tree Planting -> Environment
(5, 3); -- Weekend Reading Buddies -> Education
