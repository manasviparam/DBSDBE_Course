USE bookflow_db;
SHOW TABLES;
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    loan_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
INSERT INTO loans (loan_id, member_id, book_id, loan_date) VALUES
(1, 1, 1, '2025-02-10'),
(2, 2, 2, '2025-02-12'),
(3, 3, 3, '2025-02-15'),
(4, 1, 2, '2025-02-18'),
(5, 2, 1, '2025-02-22'),
(6, 3, 2, '2025-02-25'),
(7, 1, 3, '2025-03-01'),
(8, 2, 3, '2025-03-04'),
(9, 3, 1, '2025-03-08'),
(10, 1, 1, '2025-03-12');

SELECT * FROM loans;
SELECT
    m.full_name AS Member_Name,
    b.title AS Book_Title
FROM loans l
INNER JOIN members m ON l.member_id = m.member_id
INNER JOIN books b ON l.book_id = b.book_id;
SELECT published_year,
       COUNT(book_id) AS Total_Books
FROM books
GROUP BY published_year
ORDER BY published_year;
CREATE TABLE Donation_History (
    donation_id INT PRIMARY KEY,
    book_id INT,
    donor_name VARCHAR(100),
    donation_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
START TRANSACTION;

INSERT INTO books (book_id, title, isbn, published_year)
VALUES (4, 'Atomic Habits', '9780735211292', 2018);

INSERT INTO Donation_History (donation_id, book_id, donor_name, donation_date)
VALUES (1, 4, 'Ananya Sharma', CURDATE());

COMMIT;

SELECT * FROM Donation_History;
SELECT * FROM books;
CREATE INDEX idx_books_isbn ON books(isbn);

SELECT * FROM books
WHERE isbn = '9780735211292';
