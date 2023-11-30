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