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