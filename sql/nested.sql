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