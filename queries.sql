
-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

SELECT * FROM books;
INSERT INTO books VALUES ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');


-- Task 2: Update an Existing Member's Address.

SELECT * FROM members;
UPDATE members
SET member_address = '290 ASD St'
WHERE member_id = 'C101';


-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS104' from the issued_status table.

SELECT * FROM issued_status;
DELETE FROM issued_status
WHERE issued_id = 'IS106';



-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT * FROM issued_status;

SELECT * FROM issued_status
WHERE issued_emp_id = 'E101';


-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT issued_emp_id, 
       COUNT(*) as tot_books
FROM issued_status
GROUP BY issued_emp_id
HAVING COUNT(*) > 1;


-- ### 3. CTAS (Create Table As Select)

-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt

CREATE TABLE issued_count
AS
	SELECT b.isbn,
	       b.book_title,
		   COUNT(issued_id) as tot_issued
	FROM books b
	JOIN issued_status ist
	ON b.isbn = ist.issued_book_isbn
	GROUP BY 1, 2;

SELECT * FROM issued_count;


-- ### 4. Data Analysis & Findings

-- Task 7. **Retrieve All Books in a Specific Category:

SELECT * FROM books 
WHERE category = 'Classic';


-- Task 8: Find Total Rental Income by Category:
SELECT * FROM books ;

SELECT b.category, 
       SUM(b.rental_price)
FROM issued_status ist
JOIN books b
ON b.isbn = ist.issued_book_isbn
GROUP BY 1
ORDER BY 2 DESC;
	   

-- Task 9. **List Members Who Registered in the Last 180 Days**:
SELECT member_id,
      member_name,
	  (CURRENT_DATE - reg_Date) as tot_Days
FROM members
WHERE (CURRENT_DATE - reg_Date) < 500;


SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL '500 days';


-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:

SELECT e.emp_id,
       e.emp_name,
	   b.manager_id,
	   e2.emp_name
FROM employees e
JOIN branch b
ON e.branch_id = b.branch_id
JOIN employees e2
ON e2.branch_id = e.branch_id;


-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold

SELECT * FROM books;

SELECT * FROM books
WHERE rental_price > (
SELECT AVG(rental_price) FROM books);

-- Task 12: Retrieve the List of Books Not Yet Returned

SELECT *
FROM issued_status e
LEFT JOIN 
return_status r
ON r.issued_id = e.issued_id
WHERE r.return_id IS NULL;
	   
SELECT * 
FROM issued_status as e
LEFT JOIN
return_status as r
ON r.issued_id = e.issued_id
WHERE r.return_id IS NULL;




SELECT * FROM branch;

SELECT * FROM employees;

SELECT * FROM issued_status;

SELECT * FROM members;

SELECT * FROM return_status;