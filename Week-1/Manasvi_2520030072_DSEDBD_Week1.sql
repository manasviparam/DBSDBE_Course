CREATE DATABASE IF NOT EXISTS bookflow_db;
USE bookflow_db;

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) NOT NULL UNIQUE,
    published_year INT,
    CONSTRAINT chk_published_year CHECK (published_year < 2027)
);

CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);

INSERT INTO books (title, isbn, published_year) VALUES
('Think Like a Monk','9781982134488',2020),
('The Psychology of Money','9789390166268',2021),
('Deep Work','9781455586691',2016);

SELECT * FROM books;

INSERT INTO members (full_name,email) VALUES
('Param Raj','param.raj@example.com'),
('Niharika Sai','niharika.sai@example.com'),
('Karthik Dev','karthik.dev@example.com');

SELECT * FROM members;

DESCRIBE books;
DESCRIBE members;

-- Constraint Tests
INSERT INTO books (title,isbn,published_year)
VALUES ('Fake Book','9781982134488',2022);

INSERT INTO books (title,isbn,published_year)
VALUES (NULL,'9999999999999',2020);

INSERT INTO books (title,isbn,published_year)
VALUES ('Future Book','8888888888888',2030);

INSERT INTO members (full_name,email)
VALUES ('Duplicate User','param.raj@example.com');
