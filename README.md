# DB Baseline

**DB Baseline** is a Postgresql based DB boilerplate designed to help you quickly set up and start a new DB project.  
It provides a structured environment with separate configurations for **development** and **deployment**, ensuring a smooth transition from local testing to production.

It includes pre-configured Dockerfile and docker-compose.yml.

## 📌 How to Use

1. clone current project.
2. add '.env' file on '/db'.
3. add following code on .env file.
   ```env
    POSTGRES_USER = your_db_user
    POSTGRES_PASSWORD = your_db_password
    POSTGRES_DB = your_db_name
```
4. docker compose up -d --build