# CSE 340 - W02 Assignment: Database Retrieval

Author: Cas Perche

## What this project does

A small Express + EJS + PostgreSQL app with three pages:
- `/organizations` – lists service organizations
- `/projects` – lists service projects
- `/categories` – lists service project categories

Data model:
- `organization` → has many `project`
- `project` ↔ `categories` (many-to-many, via `project_categories`)

## Folder structure

```
cse340-w02/
├── server.js              # main Express app / routes
├── package.json
├── .env.example           # copy to .env and fill in real DB credentials
├── public/
│   └── css/style.css
└── src/
    ├── database.js        # pg connection pool
    ├── setup.sql          # run this to (re)create + seed the DB
    ├── models/
    │   ├── organizations.js
    │   ├── projects.js
    │   └── categories.js
    └── views/
        ├── index.ejs
        ├── organizations.ejs
        ├── projects.ejs
        └── categories.ejs
```

## Local setup

1. Install dependencies:
   ```
   npm install
   ```
2. Copy `.env.example` to `.env` and fill in your real PostgreSQL credentials.
3. Create your database, then run the setup script against it, e.g.:
   ```
   psql -h <host> -U <user> -d <database> -f src/setup.sql
   ```
4. Start the app:
   ```
   npm start
   ```
5. Visit `http://localhost:3000`

## Deploying to Render

1. Push this project to a new GitHub repository.
2. In Render, create a new **Web Service** connected to that repo.
3. Build command: `npm install`
4. Start command: `npm start`
5. Add environment variables in Render's dashboard (PGHOST, PGPORT, PGDATABASE, PGUSER, PGPASSWORD) matching your hosted database.
6. If you're using Render's own PostgreSQL database, run `src/setup.sql` against it (e.g. using Render's psql shell or a local psql client pointed at the external connection string) before testing the live site.
7. Once deployed, test `/organizations`, `/projects`, and `/categories` on the live Render URL.

## Submission

Submit on Canvas:
- Your GitHub repo URL
- Your live Render URL
