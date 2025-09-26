-- 1. Count total number of members
SELECT COUNT(*) AS total_members
FROM members;

-- 2. Count how many books have no ISBN
SELECT COUNT(*) AS books_without_isbn
FROM books
WHERE isbn IS NULL;

-- 3. Sum of all book copies in the library
SELECT SUM(copies) AS total_copies
FROM books;

-- 4. Average number of copies per book
SELECT AVG(copies) AS avg_copies
FROM books;

-- 5. Minimum and maximum publication year of books
SELECT MIN(publication_year) AS earliest_year,
       MAX(publication_year) AS latest_year
FROM books;

-- 6. Count of books written by each author
SELECT a.name AS author, COUNT(b.book_id) AS total_books
FROM authors a
JOIN book_authors ba ON a.author_id = ba.author_id
JOIN books b ON ba.book_id = b.book_id
GROUP BY a.name;

-- 7. Authors who have written more than 1 book (using HAVING)
SELECT a.name AS author, COUNT(b.book_id) AS total_books
FROM authors a
JOIN book_authors ba ON a.author_id = ba.author_id
JOIN books b ON ba.book_id = b.book_id
GROUP BY a.name
HAVING COUNT(b.book_id) > 1;

-- 8. Average copies of books grouped by publication year
SELECT publication_year, AVG(copies) AS avg_copies
FROM books
GROUP BY publication_year
ORDER BY publication_year DESC;

-- 9. Total borrowed books per member
SELECT m.name AS member, COUNT(br.book_id) AS total_borrowed
FROM members m
JOIN borrowings br ON m.member_id = br.member_id
GROUP BY m.name;

-- 10. Members who borrowed more than 1 book
SELECT m.name AS member, COUNT(br.book_id) AS total_borrowed
FROM members m
JOIN borrowings br ON m.member_id = br.member_id
GROUP BY m.name
HAVING COUNT(br.book_id) > 1;