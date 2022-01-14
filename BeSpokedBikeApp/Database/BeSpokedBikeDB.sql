-- Create DATABASE for BespokedBikes seed data => Encounraged to run this line first seperately.
CREATE DATABASE bespokedbikes;
-- If this line doesn't execuate, type(ctrl+U) and clike 'bespokedbikes'.
-- Execute this line seperately
USE bespokedbikes;

--Starting from the line below you can execute it as a whole.
-- All inserted datas are valid is accurately formatted.
-- If it executed with no errors, you will get (7, 8, 20, 30, 3 rows affted) message.

-- Table structure for products table.
DROP TABLE IF EXISTS products;
CREATE TABLE products (
	ProductID int primary key identity(3300,1),
	Name varchar(50),
	Manufacturer varchar(50),
	Style varchar(50),
	Purchase_Price decimal(10,2),
	Sales_Price decimal(10,2),
	Qty_on_Hand int,
	Commission_Percentage decimal(3,2),
	CONSTRAINT UK_products UNIQUE (Name, Manufacturer) 
);
-- Insert example values to the product table.
INSERT INTO products VALUES 
('Ghost','APPLE','Fitness', 220.99, 250.99, 100, 0.10),
('Giant','Microsoft','Road', 150.00, 300.00, 400, 0.25),
('Salsa','Google','Road', 275.99, 300.00, 550, 0.15),
('Cruz','Tesla','Mountain', 599.99, 700.99, 650, 0.20),
('Buzzy','Profisee','Folding', 1000.00, 1500.00, 500, 0.30),
('Trek','Amazon','Folding', 99.99, 150.00, 900, 0.25),
('Stinger','Tesla','Road', 350.50, 500.99, 600, 0.20);

-- Table structure for table 'salsperson'.
DROP TABLE IF EXISTS salesperson;
CREATE TABLE salesperson (
	SalespersonID int primary key identity(77000,1),
	FirstName varchar(50),
	LastName varchar(50),
	Address varchar(50),
	Phone varchar(15),
	StartDate DATE,
	TerminationDate DATE,
	Manager varchar(50),
	CONSTRAINT UK_salesperson UNIQUE (FirstName, LastName, Phone) 
);

-- Insert example values to the salesperson table 
INSERT INTO salesperson VALUES 
('John','Walter','450 Kennedy St NW, Atlanta GA', '123-567-8910', '2019-11-11', '2021-12-31', 'James Nelson'),
('Tom','Forest','2000 Ruth St NW, Atlanta GA', '404-123-7777', '2020-01-01', '2021-07-31', 'Sara Stephan'),
('Scott','King','359 W Lake Ave NW, Atlanta GA', '777-333-1234', '2019-03-12', '2022-01-31', 'Michael Park'),
('Emily','Gonzalez','1801 Pine Forest, Duluth GA', '111-222-3333', '2019-01-01', '2022-01-01', 'Todd Blake'),
('Tyler','Kim','373 Downing St, Lawrenceville GA', '555-777-2222', '2020-01-13', '2021-11-01', 'Michael Park'),
('Jenny','Marshall','1235 Greatwood Ter, Alpharetta GA', '888-777-3333', '2019-05-01', '2022-05-20', 'James Nelson'),
('Peter','Khan','100 Gate Dancer Way, Alpharetta GA', '100-111-1010', '2020-05-21', '2022-12-31', 'James Nelson'),
('Alex','Chen','3759 Grayridge Dr, Duluth GA', '321-789-4567', '2020-06-19', '2021-12-31', 'Sara Stephan');

-- Table structure for table 'customer'
DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
	CustomerID int primary key identity(99000,1),
	FirstName varchar(50),
	LastName varchar(50),
	Address varchar(50),
	Phone varchar(15),
	StartDate DATE
);

-- Insert example values to the customer table 
INSERT INTO customer VALUES 
('John','Smith','731 Fondren, Atlanta GA', '121-121-1212', '2019-01-10'),
('Franklin','Wong','638 Voss, Atlanta GA', '132-321-1233', '2018-09-01'),
('Joyce','English','5631 Rice, Atlanta GA', '231-321-3333', '2019-01-12'),
('Ramesh','Narayan','975 Fire Oak, Atlanta GA', '357-537-7733', '2018-01-01'),
('James','Borg','450 Stone, Atlanta GA', '654-456-5554', '2020-01-10'),
('Jennifer','Wallace','291 Berry, Atlanta GA', '789-887-9798', '2018-05-09'),
('Ahmad','Jabbar','980 Dallas, Atlanta GA', '951-159-5191', '2017-05-30'),
('Alicia','Zelaya','3321 Castle, Atlanta GA', '369-996-3963', '2019-04-21'),
('Eunchong ','Wang','1000 Water, Atlanta GA', '259-852-8822', '2018-02-22'),
('Kevin ','Jaiwant','3377 Stone Mountain, Atlanta GA', '852-222-8558', '2019-02-07'),
('Mohammed','Aamir','788 Fondation st, Atlanta GA', '741-147-7714', '2019-03-10'),
('Carter','Abdallah','963 Voss Water, Atlanta GA', '471-111-7411', '2018-08-11'),
('Ruben','Rodriguez','777 Rice Cake Ave, Atlanta GA', '104-400-4101', '2018-04-12'),
('Oscar','Aguilar','975 Firework st NW, Atlanta GA', '345-453-5345', '2018-06-01'),
('Javier','Arevalo','455 Boone Dr, Atlanta GA', '782-827-7877', '2020-01-10'),
('Noopur','Bhatt','985 Marine View Dr, Atlanta GA', '780-800-8700', '2019-08-19'),
('Victor','Bienko','756 Go Stinger NE, Atlanta GA', '381-183-1818', '2018-01-28'),
('Rohan','Bodla','785 Wow Ave, Atlanta GA', '793-399-9999', '2019-04-18'),
('Nikhil','Damani','1000 Northside Dr, Atlanta GA', '181-181-1818', '2019-03-28'),
('June','Choi','345 Walnut Ave, Atlanta GA', '288-282-2828', '2019-07-07');

-- Table structure for table sales
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
	SalesID int primary key identity(1,1),
	ProductID int,
	SalespersonID int,
	CustomerID int,
	SalesDate DATE,
	CONSTRAINT FK_sales_1 FOREIGN KEY (ProductID) REFERENCES products(ProductID) on update cascade,
	CONSTRAINT FK_sales_3 FOREIGN KEY (SalespersonID) REFERENCES salesperson (SalespersonID) on update cascade,
	CONSTRAINT FK_sales_4 FOREIGN KEY (CustomerID) REFERENCES customer (CustomerID)on update cascade
);

-- Insert example values to the sales table 
INSERT INTO sales VALUES 
(3302, 77003, 99007, '2021-02-10'),
(3300, 77003, 99000, '2021-05-06'),
(3301, 77000, 99001, '2020-08-14'),
(3306, 77004, 99000, '2021-07-10'),
(3304, 77003, 99006, '2021-10-10'),
(3304, 77003, 99005, '2020-07-10'),
(3303, 77004, 99007, '2020-06-01'),
(3303, 77003, 99009, '2021-07-14'),
(3300, 77003, 99009, '2021-07-18'),
(3302, 77006, 99016, '2020-11-27'),
(3301, 77005, 99007, '2020-12-07'),
(3301, 77003, 99016, '2021-07-10'),
(3302, 77007, 99007, '2020-06-30'),
(3302, 77002, 99007, '2020-04-21'),
(3306, 77003, 99014, '2020-03-03'),
(3306, 77007, 99014, '2021-07-10'),
(3302, 77006, 99007, '2020-07-10'),
(3305, 77003, 99018, '2021-01-25'),
(3302, 77003, 99007, '2020-04-07'),
(3302, 77002, 99007, '2021-05-10'),
(3302, 77005, 99016, '2020-11-11'),
(3304, 77003, 99016, '2021-02-20'),
(3302, 77002, 99007, '2021-04-07'),
(3300, 77003, 99019, '2020-10-02'),
(3304, 77003, 99019, '2020-08-04'),
(3302, 77004, 99007, '2020-06-29'),
(3302, 77003, 99007, '2021-06-19'),
(3301, 77003, 99007, '2021-08-06'),
(3302, 77004, 99003, '2020-10-20'),
(3305, 77000, 99018, '2020-07-07');

-- Table structure for table 'discount'
DROP TABLE IF EXISTS discount;
CREATE TABLE discount (
	DiscountID int primary key identity(88000,1),
	ProductID int,
	BeginDate DATE,
	EndDate DATE,
	DiscountPercentage decimal(3,2),
	CONSTRAINT FK_discount_1 FOREIGN KEY (ProductID) REFERENCES products (ProductID) on update cascade
);
-- Insert example data to discount table.
INSERT INTO discount VALUES 
(3301, '2021-01-01', '2021-01-31', 0.05),
(3304, '2020-12-20', '2020-12-30', 0.10),
(3305, '2020-12-01', '2020-12-31', 0.10);