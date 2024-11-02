SELECT Country_name, COUNT(*) AS NumberOfPersons
FROM Persons
GROUP BY Country_name;

-- Find the number of persons in each country sorted from high to low.
SELECT Country_name, Count(*) AS Numberofpersons 
FROM Persons 
GROUP BY Country_name 
ORDER BY Numberofpersons DESC;

-- Find out an average rating for Persons in respective countries if the average is greater than 3.0  
SELECT Country_name, AVG(Rating) AS AverageRating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

-- Find the countries with the same rating as the USA. (Use Subqueries) 
SELECT DISTINCT Country_name
FROM Persons
WHERE Rating = (SELECT AVG(Rating) FROM Persons WHERE Country_name = 'USA');

-- Select all countries whose population is greater than the average population of all nations.
SELECT Country_name
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);

-- Create a database product
CREATE DATABASE Product;

USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-1234', '123 Elm St', 'Springfield', 'IL', '62701', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak St', 'Madison', 'WI', '53703', 'USA'),
(3, 'Emily', 'Johnson', 'emily.johnson@example.com', '555-8765', '789 Pine St', 'Austin', 'TX', '73301', 'USA'),
(4, 'Michael', 'Brown', 'michael.brown@example.com', '555-4321', '321 Maple St', 'Orlando', 'FL', '32801', 'USA'),
(5, 'Sarah', 'Davis', 'sarah.davis@example.com', '555-1111', '654 Cedar St', 'Seattle', 'WA', '98101', 'USA'),
(6, 'David', 'Martinez', 'david.martinez@example.com', '555-2222', '987 Birch St', 'Denver', 'CO', '80201', 'USA'),
(7, 'Laura', 'Garcia', 'laura.garcia@example.com', '555-3333', '159 Willow St', 'Phoenix', 'AZ', '85001', 'USA'),
(8, 'James', 'Wilson', 'james.wilson@example.com', '555-4444', '753 Spruce St', 'Boston', 'MA', '02101', 'USA'),
(9, 'Linda', 'Lopez', 'linda.lopez@example.com', '555-5555', '258 Fir St', 'San Francisco', 'CA', '94101', 'USA'),
(10, 'Robert', 'Taylor', 'robert.taylor@example.com', '555-6666', '369 Ash St', 'Chicago', 'IL', '60601', 'USA');


-- create a view to display full name and Email ID
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email
FROM Customer;

-- Perform the SELECT operation for the customer_info view
SELECT * FROM customer_info;

-- Create a view named US_Customers that displays customers located in the US.
CREATE VIEW US_Customers AS
SELECT * FROM customer WHERE Country = 'USA' ;

SELECT * FROM US_Customers;

-- create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email, Phone_no, State
FROM Customer;

SELECT * FROM Customer_details;

-- Update phone numbers of customers who live in California for Customer_details view
UPDATE Customer
SET Phone_no = '555-9999'  -- Replace with actual new phone number
WHERE State = 'CA';
SELECT * FROM Customer WHERE State = 'CA';
SET SQL_SAFE_UPDATES = 0;

--  Count the number of customers in each state and show only states with more than 5 customers.
SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

--  Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer_details
GROUP BY State;

-- Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
SELECT *
FROM Customer_details
ORDER BY State ASC;








