# Design Documentation: Task Management System
## 1. Introduction
------------------------------------------------------------------
The task management system is designed to help users organize, track, and manage their tasks efficiently. It allows users to create tasks, assign them to different categories, set deadlines, and track their progress.
## 2. Database Schema
----------------------------------------------------------------
### 2.1. Users Table

| Field      | Type        | Description           |
|------------|-------------|-----------------------|
| user_id    | INT         | Unique user identifier|
| username   | VARCHAR(50) | Username              |
| email      | VARCHAR(100)| Email address         |
| password   | VARCHAR(100)| Hashed password       |
| created_at | TIMESTAMP   | Timestamp of creation |
### 2.2. Tasks Table

| Field         | Type        | Description                 |
|---------------|-------------|-----------------------------|
| task_id       | INT         | Unique task identifier      |
| user_id       | INT         | Foreign key to users table  |
| title         | VARCHAR(100)| Title of the task           |
| description   | TEXT        | Description of the task     |
| category      | VARCHAR(50) | Category of the task        |
| deadline      | DATETIME    | Deadline for the task       |
| status        | VARCHAR(20) | Status of the task          |
| created_at    | TIMESTAMP   | Timestamp of creation       |
| updated_at    | TIMESTAMP   | Timestamp of last update    |
## 3. Procedures
-------------------------------------------------------------------
### 3.1. Add Task

```sql
PROCEDURE add_task(
    IN p_user_id INT,
    IN p_title VARCHAR(100),
    IN p_description TEXT,
    IN p_category VARCHAR(50),
    IN p_deadline DATETIME
)
BEGIN
    INSERT INTO tasks (user_id, title, description, category, deadline, status, created_at, updated_at)
    VALUES (p_user_id, p_title, p_description, p_category, p_deadline, 'pending', NOW(), NOW());
END;
```
### 3.2. Update Task

```sql
PROCEDURE update_task(
    IN p_task_id INT,
    IN p_title VARCHAR(100),
    IN p_description TEXT,
    IN p_category VARCHAR(50),
    IN p_deadline DATETIME,
    IN p_status VARCHAR(20)
)
BEGIN
    UPDATE tasks
    SET title = p_title,
        description = p_description,
        category = p_category,
        deadline = p_deadline,
        status = p_status,
        updated_at = NOW()
    WHERE task_id = p_task_id;
END;
```
### 3.3. Delete Task

```sql
PROCEDURE delete_task(
    IN p_task_id INT
)
BEGIN
    DELETE FROM tasks WHERE task_id = p_task_id;
END;
```
## 4. Conclusion
--------------------------------------------------
This design documentation outlines the database schema and procedures for a task management system.It provides a foundation for implementing the system's functionality, including adding, updating, and deleting tasks.
