# LIBRARY MANAGEMENT SYSTEM

Welcome to the MySQL project Library Management System repository. This project is designed to facilitate major library operations, including managing information about books such as author, publisher, and year of publication, details of employees and customers, and tracking the status of book issues and returns.

## Overview:

The Library Management System project consists of a database schema and SQL queries to perform various operations. It contains six tables:

- Branch: Stores information about library branches such as branch number, manager ID, address, and contact number.

- Employee: Contains details of library staff including employee ID, name, position, salary, and the branch they are assigned to.

- Book: Details of books available in the library including ISBN, book title, author, publisher, rental price, availability status, and category.

- Customer: Stores information about library users including their ID, name, address, and registration date.

- IssueStatus: Records of books issued to customers including issue ID, customer ID, book name, and issue date.

- ReturnStatus: Records of books returned by customers containing return ID, customer ID, book name, and return date.

## Major Queries:

- Retrieve book title, category, and rental price of available books.

- List employee names and salaries in descending order of salary.

- Retrieve book titles and corresponding customers who have issued those books.

- Display the total count of books in each category.

- Retrieve employee names and positions for employees with salaries below Rs.20,000.

- List customer names who registered before January 1, 2022, and have not issued any books yet.

- Display branch numbers and the total count of employees in each branch.

- Display names of customers who issued books in June 2023.

- Retrieve book titles containing "history".

- Retrieve branch numbers along with the count of employees for branches having more than 5 employees.

## Additional Queries:

- List the book names that have not been issued by any customer.

- Identify the publisher with the highest number of books in the library.

- Identify the branches where the average salary of employees is above Rs.20,000.

- Create a before delete trigger to prevent deleting employee details whose salary is > Rs.20,000.

- Find the total number of customers in the customers table.

- Find out the total revenue generated from book rentals.

## How to Use:

You can clone the repository and execute the SQL queries against your database management system to gain insights and manage your library efficiently.

## Contribution:

Suggestions, contributions, and feedback are always welcome! If you have any ideas or find bugs, feel free to let us know. Your input will make this project better and more meaningful.

## Conclusion:

The Library Management System project provides an efficient way to analyze, organize, and manage library resources. By using MySQL queries, it effectively handles employee tracking, book status, customer records, and more. It facilitates extracting various information about the library environment, including book availability, customer preferences, and rental prices, contributing to better library management.
