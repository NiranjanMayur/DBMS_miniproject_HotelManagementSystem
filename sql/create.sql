CREATE TABLE Hotel(
    HotelID INT PRIMARY KEY,
    HotelName VARCHAR(100) NOT NULL,
    HotelAddress VARCHAR(255) NOT NULL,
    HotelRating INT NOT NULL,
    Hotel_Ph_No CHAR(10) NOT NULL,
    Hotel_Rooms INT NOT NULL);


CREATE TABLE Customer(
    cust_id INT PRIMARY KEY,
    cust_fname VARCHAR(255) NOT NULL,
    cust_lname VARCHAR(255) NOT NULL,
    cust_mail VARCHAR(255) UNIQUE NOT NULL,
    cust_dob VARCHAR(30) NOT NULL,
    cust_pwd VARCHAR(90) NOT NULL,
    cust_address VARCHAR(255) NOT NULL,
    cust_ph_no CHAR(10) UNIQUE NOT NULL);


CREATE TABLE Room_Type(
    type_id VARCHAR(3) PRIMARY KEY,
    room_name VARCHAR(255) NOT NULL,
    room_price DECIMAL(10, 2) NOT NULL,
    room_capacity INT NOT NULL);

CREATE TABLE Room(
    room_id INT PRIMARY KEY NOT NULL,
    type_id VARCHAR(3),
    HotelID INT,
    room_description VARCHAR(255) NOT NULL,
    occupancy_status BOOLEAN NOT NULL default 0,
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (type_id) REFERENCES Room_Type(type_id) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Reservation(
    res_id INT PRIMARY KEY,
    cust_id INT,
    room_id INT,
    HotelID INT,
    in_date DATETIME,
    out_date DATETIME,
    Number_of_days INT NOT NULL, 
    FOREIGN KEY (cust_id) REFERENCES Customer(cust_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (room_id) REFERENCES Room(room_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Transaction(
    TransactionID INT PRIMARY KEY,
    room_id INT,
    cust_id INT,
    TransactionDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Transaction_Description VARCHAR(255) NOT NULL,
    FOREIGN KEY (room_id) REFERENCES Room(room_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (cust_id) REFERENCES Customer(cust_id) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Job(
    job_id INT PRIMARY KEY,
    job_title VARCHAR(255) NOT NULL,
    salary INT NOT NULL);

CREATE TABLE Employees(
    emp_id INT PRIMARY KEY,
    job_id INT,
    HotelID INT,
    emp_fname VARCHAR(255) NOT NULL,
    emp_lname VARCHAR(255) NOT NULL,
    emp_address VARCHAR(255) UNIQUE NOT NULL,
    emp_ph_no CHAR(10) UNIQUE NOT NULL,
    emp_dob VARCHAR(255) NOT NULL,
    emp_mail VARCHAR(255) UNIQUE NOT NULL,
    FOREIGN KEY (job_id) REFERENCES Job(job_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID) ON DELETE CASCADE ON UPDATE CASCADE);



CREATE TABLE Service(
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Descrip VARCHAR(255) NOT NULL);

CREATE TABLE HotelService(
    HotelID INT,
    ServiceID INT,
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (HotelID, ServiceID));

