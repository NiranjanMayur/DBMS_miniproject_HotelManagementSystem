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



INSERT INTO Hotel (HotelID, HotelName, HotelAddress, HotelRating, Hotel_Ph_No, Hotel_Rooms)
VALUES
    (1, 'Sample Hotel 1', '123 Main Street, Sample City, USA', 4, '1234567890', 100),
    (2, 'Sample Hotel 2', '456 Elm Street, Sample Town, USA', 3, '9876543210', 75),
    (3, 'Sample Hotel 3', '789 Oak Street, Sample Village, USA', 5, '5556667777', 150),
    (4, 'Sample Hotel 4', '101 Pine Street, Sample Town, USA', 4, '4443332222', 80),
    (5, 'Sample Hotel 5', '202 Maple Street, Sample City, USA', 3, '1112223333', 120);


INSERT INTO Customer (cust_id, cust_fname, cust_lname, cust_mail, cust_dob, cust_pwd, cust_address, cust_ph_no)
VALUES
    (1, 'John', 'Doe', 'john.doe@email.com', '1990-05-15', 'password123', '456 Elm Street, Sample Town, USA', '9876543210'),
    (2, 'Jane', 'Smith', 'jane.smith@email.com', '1985-12-10', 'password456', '789 Oak Street, Sample Village, USA', '5556667777'),
    (3, 'Alice', 'Johnson', 'alice.johnson@email.com', '1995-03-20', 'password789', '101 Pine Street, Sample Town, USA', '4443332222'),
    (4, 'Bob', 'Williams', 'bob.williams@email.com', '1988-07-01', 'passwordabc', '202 Maple Street, Sample City, USA', '1112223333'),
    (5, 'Eve', 'Brown', 'eve.brown@email.com', '1992-09-05', 'passwxyz', '303 Cedar Street, Sample Village, USA', '3334445555');


INSERT INTO Room_Type (type_id, room_name, room_price, room_capacity)
VALUES
    ('001', 'Single Room', 100.00, 1),
    ('002', 'Double Room', 150.00, 2),
    ('003', 'Suite', 250.00, 4),
    ('004', 'Deluxe Room', 200.00, 2),
    ('005', 'Family Room', 180.00, 3);


INSERT INTO Room (room_id, type_id, HotelID, room_description, occupancy_status)
VALUES
    (1, '001', 1, 'Cozy single room with a view', false),
    (2, '002', 1, 'Spacious double room with balcony', false),
    (3, '003', 2, 'Luxurious suite with ocean view', false),
    (4, '004', 3, 'Deluxe room with king-size bed', false),
    (5, '005', 4, 'Family room with extra bed', false);


INSERT INTO Reservation (res_id, cust_id, room_id, HotelID, in_date, out_date, Number_of_days)
VALUES
    (1, 1, 2, 1, '2023-01-15 14:00:00', '2023-01-18 12:00:00', 3),
    (2, 2, 3, 2, '2023-02-10 15:00:00', '2023-02-14 11:00:00', 4),
    (3, 3, 4, 3, '2023-03-20 12:00:00', '2023-03-25 10:00:00', 5),
    (4, 4, 1, 4, '2023-04-05 14:00:00', '2023-04-07 12:00:00', 2),
    (5, 5, 5, 5, '2023-05-08 16:00:00', '2023-05-12 13:00:00', 4);


INSERT INTO Transaction (TransactionID, room_id, cust_id, TransactionDate, Amount, Transaction_Description)
VALUES
    (1, 2, 1, '2023-01-16', 150.00, 'Sucessful'),
    (2, 3, 2, '2023-02-12', 250.00, 'Pending'),
    (3, 4, 3, '2023-03-21', 200.00, 'Sucessful'),
    (4, 1, 4, '2023-04-06', 100.00, 'Sucessful'),
    (5, 5, 5, '2023-05-09', 180.00, 'Sucessful');


INSERT INTO Job (job_id, job_title, salary)
VALUES
    (1, 'Receptionist', 25000),
    (2, 'Housekeeping', 20000),
    (3, 'Chef', 30000),
    (4, 'Maintenance', 22000),
    (5, 'Manager', 40000);


INSERT INTO Employees (emp_id, job_id, emp_fname, emp_lname, emp_address, emp_ph_no, emp_dob, emp_mail, HotelID)
VALUES
    (1, 1, 'Sarah', 'Davis', '123 Elm Street, Sample City, USA', '5551112222', '1990-03-10', 'sarah@email.com', 1),
    (2, 2, 'Michael', 'Johnson', '456 Oak Street, Sample Town, USA', '9998887777', '1985-07-25', 'michael@email.com', 2),
    (3, 3, 'David', 'Smith', '789 Maple Street, Sample Village, USA', '3334445555', '1992-12-05', 'david@email.com', 3),
    (4, 4, 'Emily', 'White', '101 Pine Street, Sample Town, USA', '7776665555', '1988-09-15', 'emily@email.com', 4),
    (5, 5, 'Robert', 'Brown', '202 Cedar Street, Sample City, USA', '2223334444', '1995-04-20', 'robert@email.com', 5);


INSERT INTO Service (ServiceID, ServiceName, Price, Descrip)
VALUES
    (1, 'Room Service', 20.00, 'In-room dining service'),
    (2, 'Housekeeping', 30.00, 'Cleaning and maintenance service'),
    (3, 'Spa & Wellness', 50.00, 'Relaxation and massage service'),
    (4, 'Restaurant', 40.00, 'On-site dining service'),
    (5, 'Airport Shuttle', 25.00, 'Transportation service to/from the airport');


INSERT INTO HotelService (HotelID, ServiceID)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (4, 1),
    (4, 2),
    (5, 3),
    (5, 4),
    (5, 5);



SELECT Hotel.HotelName, COUNT(Reservation.res_id) AS ReservationCount
FROM Hotel
LEFT JOIN Reservation ON Hotel.HotelID = Reservation.HotelID
GROUP BY Hotel.HotelID, Hotel.HotelName;


SELECT Room_Type.room_name, SUM(Transaction.Amount) AS TotalRevenue
FROM Room_Type
LEFT JOIN Room ON Room_Type.type_id = Room.type_id
LEFT JOIN Transaction ON Room.room_id = Transaction.room_id
GROUP BY Room_Type.type_id, Room_Type.room_name;


SELECT Job.job_title, COUNT(Employees.emp_id) AS EmployeeCount
FROM Job
LEFT JOIN Employees ON Job.job_id = Employees.job_id
GROUP BY Job.job_id, Job.job_title;


SELECT Hotel.HotelName, COUNT(Room.room_id) AS TotalRooms, AVG(Room_Type.room_price) AS AvgRoomPrice
FROM Hotel
LEFT JOIN Room ON Hotel.HotelID = Room.HotelID
LEFT JOIN Room_Type ON Room.type_id = Room_Type.type_id
GROUP BY Hotel.HotelID, Hotel.HotelName;


SELECT Hotel.HotelName, COUNT(HotelService.ServiceID) AS TotalServices
FROM Hotel
LEFT JOIN HotelService ON Hotel.HotelID = HotelService.HotelID
GROUP BY Hotel.HotelID, Hotel.HotelName;


SELECT 
    Employees.emp_id,
    Employees.emp_fname,
    Employees.emp_lname,
    Employees.emp_address,
    Job.job_id,
    Job.job_title
FROM Employees
RIGHT JOIN Job ON Employees.job_id = Job.job_id;


SELECT 
    Customer.cust_id,
    Customer.cust_fname,
    Customer.cust_lname,
    Customer.cust_mail,
    Reservation.res_id,
    Reservation.in_date,
    Reservation.out_date
FROM Customer
NATURAL JOIN Reservation;


SELECT Hotel.HotelID, Hotel.HotelName, Hotel.HotelRating
FROM Hotel
WHERE Hotel.HotelRating = (
    SELECT MAX(HotelRating)
    FROM Hotel
);


SELECT Hotel.HotelID, Hotel.HotelName, Hotel.HotelRating
FROM Hotel
WHERE Hotel.HotelRating = (
    SELECT MIN(HotelRating)
    FROM Hotel
);


SELECT cust_fname, cust_lname, cust_mail, cust_ph_no
FROM Customer
WHERE cust_id IN (
SELECT cust_id
FROM Reservation
WHERE HotelID IN (
SELECT HotelID
FROM Hotel
WHERE HotelRating > 4
));


SELECT HotelID, COUNT(*) AS TotalRooms FROM Room GROUP BY HotelID
UNION ALL
SELECT HotelID, COUNT(*) AS TotalEmployees FROM Employees GROUP BY HotelID;




DELIMITER //

CREATE FUNCTION CalculateTotalRevenue(HotelID_param INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE totalRevenue DECIMAL(10, 2);

    SELECT SUM(Amount) INTO totalRevenue
    FROM Transaction
    WHERE room_id IN (SELECT room_id FROM Reservation WHERE HotelID = HotelID_param) and cust_id IN (SELECT cust_id FROM Reservation WHERE HotelID = HotelID_param);

    RETURN totalRevenue;
END //

DELIMITER ;

SELECT CalculateTotalRevenue(1) AS totalRevenue;


DELIMITER //

CREATE FUNCTION GetAvailableServicesForHotel(HotelID_param INT) RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE availableServices VARCHAR(255);

    SELECT GROUP_CONCAT(ServiceName)
    INTO availableServices
    FROM HotelService
    JOIN Service ON HotelService.ServiceID = Service.ServiceID
    WHERE HotelID = HotelID_param;

    RETURN availableServices;
END //

DELIMITER ;

SELECT GetAvailableServicesForHotel(1) AS availableServices;



DELIMITER //

CREATE PROCEDURE CalculateReservationDays(IN reservation_id INT, OUT days INT)
BEGIN
    DECLARE in_date_val DATETIME;
    DECLARE out_date_val DATETIME;

    -- Get the in_date and out_date for the specified reservation_id
    SELECT in_date, out_date INTO in_date_val, out_date_val
    FROM Reservation
    WHERE res_id = reservation_id;

    -- Calculate the number of days
    SET days = DATEDIFF(out_date_val, in_date_val);
END //

DELIMITER ;

CALL CalculateReservationDays(1, @result);
SELECT @result AS NumberOfDays;




DELIMITER //

CREATE TRIGGER PreventRoomDeletion
BEFORE DELETE ON Room
FOR EACH ROW
BEGIN
IF (SELECT COUNT(*) FROM Reservation WHERE room_id = OLD.room_id) > 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Cannot delete a room with active reservations.';
END IF;
END;

//

DELIMITER ;


DELIMITER //

CREATE TRIGGER updateRoomOccupancy AFTER INSERT ON Reservation
FOR EACH ROW
BEGIN

UPDATE Room
SET occupancy_status = 1
WHERE room_id = NEW.room_id;
END //

DELIMITER ;

