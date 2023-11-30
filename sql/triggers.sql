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

