-- Library Management System Database Schema

-- Categories of books
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- Authors of books
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

-- Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publish_year YEAR,
    category_id INT NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    CONSTRAINT fk_books_category FOREIGN KEY (category_id) REFERENCES Categories(category_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Many-to-Many relation: Books and Authors
CREATE TABLE BookAuthors (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    CONSTRAINT fk_ba_book FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_ba_author FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Borrowers of books
CREATE TABLE Borrowers (
    borrower_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    registration_date DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Loans table to track which borrower borrowed which book and when
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    borrower_id INT NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    CONSTRAINT fk_loans_book FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_loans_borrower FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT chk_dates CHECK (due_date >= loan_date),
    CONSTRAINT chk_return_date CHECK (return_date IS NULL OR return_date >= loan_date)
);

