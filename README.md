# Online Bookstore Database — Basic SQL Assignment

## Database Schema

### Authors
| Column | Data Type | Constraint |
| :--- | :--- | :--- |
| **author_id** | INT | PRIMARY KEY |
| **author_name** | VARCHAR(100) | NOT NULL |
| **country** | VARCHAR(50) | |

---

### Books
| Column | Data Type | Constraint |
| :--- | :--- | :--- |
| **book_id** | INT | PRIMARY KEY |
| **title** | VARCHAR(100) | |
| **author_id** | INT | FOREIGN KEY |
| **category** | VARCHAR(50) | |
| **price** | DECIMAL(10,2) | |
| **published_year** | INT | |

`Books.author_id` references `Authors.author_id`.

---

### Publishers
| Column | Data Type | Constraint |
| :--- | :--- | :--- |
| **publisher_id** | INT | PRIMARY KEY |
| **publisher_name** | VARCHAR(100) | NOT NULL, UNIQUE |
| **country** | VARCHAR(50) | |
| **established_year** | INT | DEFAULT 2000 |

---

## Steps to Execute the SQL Script

### 1. Install MySQL
Install:
* MySQL Community Server
* MySQL Workbench

### 2. Open MySQL Workbench
Open MySQL Workbench and connect to the local MySQL server using the `root` user.

### 3. Open the SQL Script
Open the `sql-basic-assignment.sql` file in MySQL Workbench.

### 4. Select the Database
The script creates and uses the `bookstore_db` database:

```sql
CREATE DATABASE IF NOT EXISTS bookstore_db;
USE bookstore_db;

```

### 5. Execute the Script

Run the SQL statements in order using the Execute button in MySQL Workbench.

The script will:

* Create the `Authors`, `Books`, and `Publishers` tables.
* Insert sample records into the `Authors` and `Books` tables.
* Execute all 21 assignment tasks sequentially.

---

## Task Execution Screenshots

### 1. Aggregate Functions (Task 12)

---

### 2. INNER JOIN (Task 15)

---

### 3. CREATE TABLE Publishers (Task 21)
