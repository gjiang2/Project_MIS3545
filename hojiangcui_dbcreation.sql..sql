/*Minh Ho, Gianni Jiang and Jeffery Cui*/
CREATE DATABASE YelpDatabase;
GO

USE YelpDatabase;
GO

-- Create tables
CREATE TABLE Business(
  BusinessID bigint NOT NULL PRIMARY KEY,
  CategoryID bigint NOT NULL,
  BusinessName varchar(250) NOT NULL,
  PhoneNumber varchar(250) NOT NULL,
  BusinessHours varchar(250) NOT NULL,
  Address varchar(250) NOT NULL,
  City varchar(250) NOT NULL,
  State varchar(250) NOT NULL,
  BusinessZipCode varchar(250) NOT NULL);

CREATE TABLE Category(
  CategoryID bigint NOT NULL PRIMARY KEY,
  CategoryName varchar(250) NOT NULL);

CREATE TABLE Review(
  ReviewID bigint NOT NULL PRIMARY KEY,
  ReviewerID bigint NOT NULL,
  BusinessID bigint NOT NULL,
  Score varchar(250) NOT NULL,
  Description varchar(250) NOT NULL);

 CREATE TABLE Reviewer(
  ReviewerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(250) NOT NULL,
  LastName varchar(250) NOT NULL,
  Email varchar(250) NOT NULL,
  Password varchar(250) NOT NULL,
  ReviewerZipCode varchar(250) NOT NULL,
  DateofBirth varchar(250) NOT NULL,
  Gender varchar(250) NOT NULL);

CREATE TABLE Picture(
  PictureID bigint NOT NULL PRIMARY KEY,
  ReviewerID bigint NOT NULL,
  BusinessID bigint NOT NULL,
  FileSource varchar(250) NOT NULL,
  Comment varchar(250) NOT NULL);

-- Create the relationships 
ALTER TABLE Business ADD CONSTRAINT FK_Business_Category
FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID);
GO

ALTER TABLE Review ADD CONSTRAINT FK_Review_Picture
FOREIGN KEY (ReviewerID) REFERENCES Reviewer(ReviewerID);
GO

ALTER TABLE Review ADD CONSTRAINT FK_Review_Business
FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID);
GO

ALTER TABLE Picture ADD CONSTRAINT FK_Picture_Reviewer
FOREIGN KEY (ReviewerID) REFERENCES Reviewer(ReviewerID);
GO

ALTER TABLE Picture ADD CONSTRAINT FK_Picture_Business
FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID);
GO


-- Add a few students
INSERT INTO Category (CategoryID, CategoryName) VALUES 
(1, 'Restaurant'),
(2, 'Bar'),
(3, 'Postal Service'),
(4, 'Convenience Store'),
(5, 'Supermarket'),
(6, 'Superstore'),
(7, 'Parking Garage'),
(8, 'Theatre'),
(9, 'Fast Food'),
(10, 'Dry Cleaning And Laundry');

INSERT INTO Business (BusinessID, CategoryID, BusinessName, PhoneNumber, BusinessHours, Address, City, State, BusinessZipCode) VALUES 
(1, '1', 'Karibu', '781-899-7444', '07:00-22:30', '10 Crescent St', 'Waltham', 'MA', '02453'),
(2, '1', 'Red Bird', '781-891-5486', '17:00-00:00', '361 Moody St', 'Waltham', 'MA', '02453'),
(3, '9', 'McDonalds', '617-527-9693', 'NA', '197 California St', 'Newton', 'MA', '02456'),
(4, '2', 'Club eNVy Allston', '617-921-8999', '22:30-02:00', '20 Linden St', 'Allston', 'MA', '02134'),
(5, '10', 'Holly Cleaners', '617-527-0770', '07:00-19:00', '1314 Centre St', 'Newton', 'MA', '02459'),
(6, '3', 'The UPS Store', '781-893-7411', '08:30-19:00', '738 Main St', 'Waltham', 'MA', '02451'),
(7, '4', '7-Eleven', '617-965-0976', '24-7', '1639 Centre St', 'Newton', 'MA', '02461'),
(8, '1', 'Pho 1 Waltham', '781-891-6977', '11:30-21:00', '374 Moody St', 'Waltham', 'MA', '023453'),
(9, '1', 'Sushi Box', '781-894-9783', '11:30-22:30', '617 Main St', 'Waltham', 'MA', '02452'),
(10, '5', 'Hannaford Supermarket', '781-893-6776', '07:00-23:00', '55 Russell St', 'Waltham', 'MA', '02154');

INSERT INTO Reviewer (ReviewerID, FirstName, LastName, Email, Password, ReviewerZipCode, DateofBirth, Gender) VALUES 
(31, 'Minh', 'Ho', 'mho2@babson.edu', 'bird', '02451', '09-17-1995', 'Male'),
(182, 'Gianni', 'Jiang', 'gjiang2@babson.edu', 'onetwo', '02451', '03-17-1996', 'Male'),
(93, 'Jeffery', 'Cui', 'jcui1@babson.edu', 'melissa', '02457', '11-15-1996', 'Male'),
(41, 'Boxun', 'Li', 'bli1@babson.edu', 'denise', '02452', '02-29-1996', 'Male'),
(53, 'Sa', 'Nguyen', 'sanguyen@gmail.com', 'qwerty', '18015', '04-08-1994', 'Female'),
(67, 'Monika', 'Jiang', 'mjiang@hotmail.com', 'gdragon', '02531', '07-18-1999', 'Female'),
(127, 'Vivia', 'Chen', 'ychen7@babson.edu', 'bmw', '02451', '02-09-1996', 'Female'),
(28, 'Shirley', 'Wang', 'swang@lehigh.edu', 'boxun', '18015', '07-11-1995', 'Female'),
(139, 'Tracy', 'Chin', 'tchin2@babson.edu', 'puppy', '02457', '11-15-1996', 'Female'),
(10, 'Huy', 'Nguyen', 'nbhuy@gmail.edu', 'leila', '00000', '09-21-1994', 'Male');

INSERT INTO Picture (PictureID, ReviewerID, BusinessID, Comment, FileSource) VALUES
(1, '31', '1', 'abc', 'NA'),
(2, '31', '8', 'cnn', 'NA'),
(3, '31', '4', 'wow', 'NA'),
(4, '139', '7', 'good', 'NA'),
(5, '10', '8', 'discount', 'NA'),
(6, '28', '4', 'love boxun', 'NA'),
(7, '93', '4', 'its lit', 'NA'),
(8, '182', '3', 'cynthia', 'NA'),
(9, '182', '5', 'taiwan', 'NA'),
(10, '67', '2', 'fire', 'NA');

INSERT INTO Review (ReviewID, ReviewerID, BusinessID, Score, Description) VALUES
(1, '31', '1', '3', 'abc'),
(2, '31', '8', '4', 'xyz'),
(3, '31', '4', '5', 'end'),
(4, '139', '7', '1', 'rats'),
(5, '10', '8', '5', 'met lebron'),
(6, '28', '4', '4', 'awesome'),
(7, '93', '4', '5', 'best day of my life'),
(8, '182', '3', '3', 'mediocre'),
(9, '182', '5', '5', 'no way'),
(10, '67', '2', '5', 'whats gucci');

