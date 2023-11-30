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
