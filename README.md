
# README for SiteTracker\_backend (API)

> **Note:** This API serves the [SiteTracker frontend](https://github.com/Shubham-860/SiteTracker). Configure and run this repo first.

## Project Overview

RESTful API to register sites, perform uptime checks, and serve metrics to the frontend.

## Features

* JWT authentication
* CRUD operations for sites
* Scheduled uptime checks
* Metrics endpoints

## Tech Stack

* Node.js & Express
* MySQL
* Sequelize ORM

## System Requirements

* Node.js ≥ 14
* MySQL Server
* SQL Workbench (or MySQL client)

## Getting Started

### Database Setup

```sql
CREATE DATABASE sitetracker_db;
```

Import schema:

```bash
mysql -u user -p sitetracker_db < schema.sql
```

### Installation & Run

```bash
git clone https://github.com/Shubham-860/SiteTracker_backend.git
cd SiteTracker_backend
npm install
# Create .env with DB_HOST, DB_USER, DB_PASS, DB_NAME=sitetracker_db, JWT_SECRET, PORT
npm start
```

API runs at `http://localhost:4000/api`.

## API Documentation

| Method | Endpoint           | Description            |
| ------ | ------------------ | ---------------------- |
| POST   | /api/auth/register | Register new user      |
| POST   | /api/auth/login    | Login, return JWT      |
| GET    | /api/sites         | List sites             |
| POST   | /api/sites         | Add site               |
| GET    | /api/sites/\:id    | Site details & metrics |
| PUT    | /api/sites/\:id    | Update site            |
| DELETE | /api/sites/\:id    | Delete site            |

## Project Structure

```text
SiteTracker_backend/
├── controllers/
├── models/
├── routes/
├── migrations/
├── schema.sql
└── app.js
```

## Contact

Shubham Sharad Salunkhe
GitHub: [https://github.com/Shubham-860](https://github.com/Shubham-860)
Instagram: [https://www.instagram.com/shubham\_salunkhe\_ss/](https://www.instagram.com/shubham_salunkhe_ss/)

© 2025 All rights reserved. Permission required for use.
