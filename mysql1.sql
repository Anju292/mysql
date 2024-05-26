-- Create the Library Management System database
CREATE DATABASE LibraryManagementSystem;

-- Use the Library Management System database
USE LibraryManagementSystem;
-- Create the Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY NOT NULL,
    Manager_Id INT NOT NULL,
    Branch_address VARCHAR(200),
    Contact_no VARCHAR(20) UNIQUE
);
-- Create the Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY NOT NULL,
    Emp_name VARCHAR(45),
    Position VARCHAR(45),
    Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
-- Create the Book table
CREATE TABLE Book (
    ISBN VARCHAR(45) PRIMARY KEY,
    Book_title VARCHAR(45),
    Category VARCHAR(45),
    Rental_Price DECIMAL(10,2),
    Status ENUM('yes','no'),
    Author VARCHAR(45),
    Publisher VARCHAR(45)
);
-- Create the Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(45),
    Customer_address VARCHAR(200),
    Reg_date DATE
);
-- Create the IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(45),
    Issue_date DATE,
    Isbn_book VARCHAR(45),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Book(ISBN)
);

-- Create the ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust VARCHAR(20),
    Return_book_name VARCHAR(45),
    Return_date DATE,
    Isbn_book2 VARCHAR(50),
    FOREIGN KEY (Isbn_book2) REFERENCES Book(ISBN)
);
-- Insert values into the Branch table
INSERT INTO Branch VALUES
(9, 100, 'Mumbai', '777777'),
(20, 1012, 'Mumbai', '222222'),
(82, 10022, 'Mumbai', '33333'),
(81, 10067, 'Mumbai', '44444444');

-- Insert values into the Employee table
INSERT INTO Employee VALUES
(500, 'Fera', 'Librarian', 10000.00, 8),
(504, 'Ahana', 'Coordinator', 12000.00, 5);
-- Insert values into the Book table
INSERT INTO Book VALUES
('ISBN13:978-04411', 'KAYAR', 'MALAYALAM NOVEL', 500, 'YES', 'THAKAZHI', 'DC BOOKS'),
('ISBN13:978-006231', 'DRIVE', 'BUSINESS', 300, 'NO', 'DANIEL H.PINK', 'RIVERHEAD BOOKS'),
('ISBN13:978-04415', 'NEUROMANCER', 'SCIENCE FICTION', 500, 'NO', 'WILLIAM GIBSON', 'ACE BOOKS'),
('ISBN13:978-04156', 'BOSSYPANTS', 'BIOGRAPHY', 4500, 'NO', 'TINA FEY', 'BACK BAY BOOKS'),
('ISBN13:978-81264', 'OZHICHUVIDUKA', 'FICTION', 450, 'NO', 'SARAH JOSEPH', 'DC BOOKS'),
('ISBN13:978-8165', 'NALLAVANNAM', 'FICTION', 200, 'NO', 'C.RADHAKRISHNAN', 'DC BOOKS');

-- Insert values into the Customer table
INSERT INTO Customer VALUES
(1200, 'Anu', 'Kerala', '2021-05-11'),
(1201, 'ROHIT', 'Karnataka', '2021-10-22'),
(1202, 'Albi', 'kerala', '2021-04-22'),
(1203, 'Sanil', 'Karnataka', '2021-03-22'),
(1204, 'Swapna', 'kerala', '2021-12-22');

-- Insert values into the IssueStatus table
INSERT INTO IssueStatus VALUES
(001, 1200, '2021-11-15', 'ISBN13:978-04411'),
(002, 1202, '2022-03-13', 'ISBN13:978-006231'),
(003, 1203, '2022-07-13', 'ISBN13:978-006231'),
(004, 1204, '2022-05-13', 'ISBN13:978-006231'),
(005, 1205, '2022-04-13', 'ISBN13:978-006231');

-- Insert values into the ReturnStatus table
INSERT INTO ReturnStatus VALUES
(200, 'Anu', 'KAYAR', '2022-02-28', 'ISBN13:978-04411'),
(201, 'Mrdula', 'THE ALCHEMIST', '2022-12-30', 'ISBN13:978-006231');

-- Retrieve book title, category, and rental price of available books
SELECT Book_title, Category, Rental_Price FROM Book WHERE Status = 'YES';

-- List employee names and salaries in descending order of salary
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- Retrieve book titles and corresponding customers who have issued those books
SELECT i.Issued_cust, b.Book_title, c.Customer_name
FROM IssueStatus i
JOIN Book b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- Display the total count of books in each category
SELECT Category, COUNT(*) AS Total_count_of_books FROM Book GROUP BY Category;


-- Retrieve employee names and positions for employees with salaries below Rs.20,000
SELECT Emp_name, Position FROM Employee WHERE Salary < 20000;

-- List customer names who registered before January 1, 2022, and have not issued any books yet
SELECT c.Customer_name, c.Reg_date
FROM Customer c
LEFT JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE c.Reg_date < '2022-01-01' AND i.Issue_Id IS NULL;

-- Display branch numbers and the total count of employees in each branch
SELECT b.Branch_no, COUNT(e.Emp_Id) AS Total_count_employees
FROM Branch b
LEFT JOIN Employee e ON b.Branch_no = e.Branch_no
GROUP BY b.Branch_no;

-- Display names of customers who issued books in June 2023
SELECT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE YEAR(i.Issue_date) = 2023 AND MONTH(i.Issue_date) = 6;

-- Retrieve book titles containing "history"
SELECT Book_title
FROM Book
WHERE Category LIKE '%BUSINES%';

-- Retrieve branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no, COUNT(*) AS Total_count_emp
FROM Employee
GROUP BY Branch_no
HAVING Total_count_emp > 5;