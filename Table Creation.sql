-- Creating Branch table

DROP TABLE IF EXISTS branch;
CREATE TABLE branch(

           branch_id varchar(10) PRIMARY KEY,
		   manager_id	varchar(10),
		   branch_address	varchar(100),
		   contact_no varchar(10)

)

-- Creating Employees table

DROP TABLE IF EXISTS employees;
CREATE TABLE employees(

           emp_id varchar(10) PRIMARY KEY,
		   emp_name	varchar(25),
		   position	varchar(25),
		   salary INTEGER,
		   branch_id varchar(25)

)

-- Creating Books table

DROP TABLE IF EXISTS books;
CREATE TABLE books(

           isbn varchar(40) PRIMARY KEY,
		   book_title	varchar(75),
		   category	varchar(25),
		   rental_price FLOAT,
		   status varchar(25),
		   author varchar(25),
		   publisher varchar(100)

)

-- Creating Books members

DROP TABLE IF EXISTS members;
CREATE TABLE members(

           member_id varchar(10) PRIMARY KEY,
		   member_name	varchar(30),
		   member_address	varchar(50),
		   reg_date DATE

)

-- Creating issued_status members

issued_id	issued_member_id	issued_book_name	issued_date	issued_book_isbn	issued_emp_id


DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status(

           issued_id varchar(10) PRIMARY KEY,
		   issued_member_id	varchar(10),
		   issued_book_name	varchar(50),
		   issued_date DATE,
		   issued_book_isbn varchar(30),
		   issued_emp_id varchar(20)

)

-- Creating return_status members


DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status(

           return_id varchar(10) PRIMARY KEY,
		   issued_id	varchar(10),
		   return_book_name	varchar(50),
		   return_date DATE,
		   return_book_isbn varchar(30)
		   

)
