SELECT HotelID, COUNT(*) AS TotalRooms FROM Room GROUP BY HotelID
UNION ALL
SELECT HotelID, COUNT(*) AS TotalEmployees FROM Employees GROUP BY HotelID;
