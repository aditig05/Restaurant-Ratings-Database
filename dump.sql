-- Create the Restaurant_Ratings database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Restaurant_Ratings;

-- Use the Restaurant_Ratings database
USE Restaurant_Ratings;

-- Create the Restaurant table
CREATE TABLE IF NOT EXISTS Restaurant (
  cin_num varchar(20) NOT NULL,
  name varchar(20) DEFAULT NULL,
  PRIMARY KEY (cin_num)
);

-- Insert data into the Restaurant table
INSERT INTO Restaurant (cin_num, name) VALUES ('Pizza Hut 557623', 'Pizza Hut');

-- Create the Branch table
CREATE TABLE IF NOT EXISTS Branch (
  Res varchar(20) NOT NULL,
  Branch_id int NOT NULL,
  PRIMARY KEY (Branch_id, Res),
  KEY Res (Res),
  CONSTRAINT Branch_ibfk_1 FOREIGN KEY (Res) REFERENCES Restaurant (cin_num)
);

-- Insert data into the Branch table
INSERT INTO Branch (Res, Branch_id) VALUES ('Pizza Hut 557623', 123), ('Pizza Hut 557623', 391);

-- Create the Employee table
CREATE TABLE IF NOT EXISTS Employee (
  Employee_id varchar(20) NOT NULL,
  Branch_id int NOT NULL,
  Super_id varchar(20) NOT NULL,
  Res varchar(20) NOT NULL,
  PRIMARY KEY (Employee_id),
  KEY Branch_id (Branch_id),
  KEY Res (Res),
  CONSTRAINT Employee_ibfk_1 FOREIGN KEY (Branch_id) REFERENCES Branch (Branch_id),
  CONSTRAINT Employee_ibfk_2 FOREIGN KEY (Res) REFERENCES Branch (Res),
  CONSTRAINT Employee_chk_1 CHECK (
    (SUBSTRING(Employee_id, 1, 2) IN ('WA', 'HC', 'SC', 'MA'))
  ),
  CONSTRAINT Employee_chk_3 CHECK (
    (SUBSTRING(Super_id, 1, 2) = 'MA')
  )
);

-- Insert data into the Employee table
INSERT INTO Employee (Employee_id, Branch_id, Super_id, Res) VALUES
  ('HC11111', 123, 'MA1111', 'Pizza Hut 557623'),
  ('HC33333', 391, 'MA3333', 'Pizza Hut 557623'),
  ('MA1111', 123, 'MA1111', 'Pizza Hut 557623'),
  ('MA3333', 391, 'MA3333', 'Pizza Hut 557623'),
  ('SC11112', 123, 'MA1111', 'Pizza Hut 557623'),
  ('SC33334', 391, 'MA3333', 'Pizza Hut 557623'),
  ('WA11111', 123, 'MA1111', 'Pizza Hut 557623'),
  ('WA11112', 123, 'MA1111', 'Pizza Hut 557623'),
  ('WA33333', 391, 'MA3333', 'Pizza Hut 557623'),
  ('WA33334', 391, 'MA3333', 'Pizza Hut 557623');

-- Create the Manager table
CREATE TABLE IF NOT EXISTS Manager (
  Manager_id varchar(20) NOT NULL,
  PRIMARY KEY (Manager_id),
  CONSTRAINT Manager_ibfk_1 FOREIGN KEY (Manager_id) REFERENCES Employee (Employee_id)
);

-- Insert data into the Manager table
INSERT INTO Manager (Manager_id) VALUES ('MA1111'), ('MA3333');

-- Create the Waiter table
CREATE TABLE IF NOT EXISTS Waiter (
  Waiter_id varchar(20) NOT NULL,
  PRIMARY KEY (Waiter_id),
  CONSTRAINT Waiter_ibfk_1 FOREIGN KEY (Waiter_id) REFERENCES Employee (Employee_id),
  CONSTRAINT Waiter_chk_1 CHECK (
    (SUBSTRING(Waiter_id, 1, 2) = 'WA')
  )
);

-- Insert data into the Waiter table
INSERT INTO Waiter (Waiter_id) VALUES ('WA11111'), ('WA11112'), ('WA33333'), ('WA33334');

-- Create the Dish table
CREATE TABLE IF NOT EXISTS Dish (
  Dish_name varchar(20) NOT NULL,
  Price int NOT NULL,
  PRIMARY KEY (Dish_name),
  CONSTRAINT Dish_ibfk_1 FOREIGN KEY (Dish_name) REFERENCES Recipe (Recipe_name),
  CONSTRAINT Dish_chk_1 CHECK (Price >= 0)
);

-- Insert data into the Dish table
INSERT INTO Dish (Dish_name, Price) VALUES
  ('Brownie', 80),
  ('chicken biryani', 450),
  ('Onion Rings', 200),
  ('Steak', 600),
  ('Veg fried Rice', 300);

-- Create the Recipe table
CREATE TABLE IF NOT EXISTS Recipe (
  Recipe_name varchar(20) NOT NULL,
  Ingredients varchar(255) NOT NULL,
  PRIMARY KEY (Recipe_name, Ingredients)
);

-- Insert data into the Recipe table
INSERT INTO Recipe (Recipe_name, Ingredients) VALUES
  ('Brownie', 'baking powder'),
  ('Brownie', 'butter'),
  ('Brownie', 'chocolate'),
  ('Brownie', 'egg'),
  ('Brownie', 'flour'),
  ('Brownie', 'ice cream'),
  ('Brownie', 'sugar'),
  ('chicken biryani', 'chicken'),
  ('chicken biryani', 'chillies'),
  ('chicken biryani', 'mint'),
  ('chicken biryani', 'onion'),
  ('chicken biryani', 'rice'),
  ('chicken biryani', 'salt'),
  ('Onion Rings', 'bread crumbs'),
  ('Onion Rings', 'egg'),
  ('Onion Rings', 'flour'),
  ('Onion Rings', 'oil'),
  ('Onion Rings', 'onion'),
  ('Onion Rings', 'salt'),
  ('Steak', 'beef'),
  ('Steak', 'butter'),
  ('Steak', 'garlic'),
  ('Steak', 'oil'),
  ('Steak', 'salt'),
  ('Veg fried Rice', 'beans'),
  ('Veg fried Rice', 'cabbage'),
  ('Veg fried Rice', 'carrot'),
  ('Veg fried Rice', 'peas'),
  ('Veg fried Rice', 'rice'),
  ('Veg fried Rice', 'salt');

-- Create the Customers table
CREATE TABLE IF NOT EXISTS Customers (
  Phone char(10) NOT NULL,
  Entry_time datetime NOT NULL,
  PRIMARY KEY (Phone, Entry_time),
  CONSTRAINT Valid_number CHECK (
    (LENGTH(Phone) = 10) AND (Phone REGEXP '^[0-9]*$')
  )
);

-- Insert data into the Customers table
INSERT INTO Customers (Phone, Entry_time) VALUES
  ('6666666666', '2020-10-01 21:50:00'),
  ('7777777777', '2020-09-05 12:14:59'),
  ('8888888888', '2020-06-21 13:45:56'),
  ('9999999999', '2020-07-13 20:30:17');

-- Create the Dish_meal table
CREATE TABLE IF NOT EXISTS Dish_meal (
  Dish_name varchar(20) NOT NULL,
  Meal varchar(20) NOT NULL,
  PRIMARY KEY (Dish_name, Meal),
  CONSTRAINT Dish_meal_ibfk_1 FOREIGN KEY (Dish_name) REFERENCES Dish (Dish_name),
  CONSTRAINT Dish_meal_chk_1 CHECK (
    (Meal IN ('Breakfast', 'Lunch', 'Dinner', 'Snacks', 'Dessert'))
  )
);

-- Insert data into the Dish_meal table
INSERT INTO Dish_meal (Dish_name, Meal) VALUES
  ('Brownie', 'Dessert'),
  ('chicken biryani', 'Dinner'),
  ('Onion Rings', 'Snacks'),
  ('Steak', 'Dinner'),
  ('Steak', 'Lunch'),
  ('Veg fried Rice', 'Dinner'),
  ('Veg fried Rice', 'Lunch');

-- Create the Feedback table
CREATE TABLE IF NOT EXISTS Feedback (
  Waiter_id varchar(20) NOT NULL,
  Chef_id varchar(20) NOT NULL,
  Dish_name varchar(20) NOT NULL,
  Phone char(10) NOT NULL,
  Entry_time datetime NOT NULL,
  Suggestion varchar(255) DEFAULT NULL,
  Rating int NOT NULL,
  PRIMARY KEY (Waiter_id, Chef_id, Dish_name, Phone, Entry_time),
  KEY Chef_id (Chef_id),
  KEY Dish_name (Dish_name),
  KEY Phone (Phone, Entry_time),
  CONSTRAINT Feedback_ibfk_1 FOREIGN KEY (Waiter_id) REFERENCES Waiter (Waiter_id),
  CONSTRAINT Feedback_ibfk_2 FOREIGN KEY (Chef_id) REFERENCES Chef (Chef_id),
  CONSTRAINT Feedback_ibfk_3 FOREIGN KEY (Dish_name) REFERENCES Dish (Dish_name),
  CONSTRAINT Feedback_ibfk_4 FOREIGN KEY (Phone, Entry_time) REFERENCES Customers (Phone, Entry_time),
  CONSTRAINT Feedback_chk_1 CHECK ((Rating >= 0) AND (Rating <= 10))
);

-- Insert data into the Feedback table
INSERT INTO Feedback (Waiter_id, Chef_id, Dish_name, Phone, Entry_time, Suggestion, Rating) VALUES
  ('WA11111', 'HC11111', 'Brownie', '6666666666', '2020-10-01 21:50:00', 'Outstanding', 10),
  ('WA11112', 'SC11112', 'Onion Rings', '8888888888', '2020-06-21 13:45:56', 'Very tasty. Will return for these!', 9);
