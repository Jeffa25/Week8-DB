# Week8-DB
 PROJECT TITLE
- Library Management System Database Schema

DESCRIPTION OF WHAT THE PROJECT DOES
-- This database schema models a library system with tables for books, authors, categories, borrowers, and loans.

-- It includes proper primary keys, foreign keys, constraints, and relationships:

- Books and Authors have a many-to-many relationship via BookAuthors table.

- Books belong to a Category (one-to-many).

- Borrowers can loan multiple books (one-to-many via Loans table).

- Constraints enforce data integrity such as unique ISBNs, emails, and date checks.

HOW TO RUN/SETUP THE PROJECT


    1.Install MySQL: Ensure that you have MySQL Server installed on your machine. You can download it from the MySQL official website.

    2.Open MySQL Command Line:
        You can use the MySQL Command Line Client or any MySQL GUI tool like MySQL Workbench, phpMyAdmin, or DBeaver.

    3.Create a Database:
        Before importing the SQL file, you need to create a database where the tables will be created. You can do this by executing the following command in the MySQL command line:

        CREATE DATABASE library_management;
USE library_management;

    4. Import the SQL File:

    If you are using the MySQL Command Line Client, you can import the SQL file using the following command: 
      SOURCE /path/to/your/library_management_system.sql;
      
      Replace /path/to/your/ with the actual path where the library_management_system.sql file is located.

    5. Verify the Tables:

    After importing, you can verify that the tables have been created successfully by running:

    SHOW TABLES;

    6.

Start Using the Database:

    You can now start inserting data into the tables or querying them as needed.

