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
