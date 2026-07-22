DROP PROCEDURE IF EXISTS sp_ResrvedTablesReport;
GO
CREATE PROCEDURE sp_ResrvedTablesReport (@start_date DATE , @end_date DATE )
-- Purpose: Generate a report of tables reserved within a specified date range.
AS BEGIN
SELECT Reservations.*,
       Restaurants.Name,
       Restaurants.PhoneNumber
    FROM Restaurants

    JOIN Reservations
    ON Restaurants.RestaurantId = Reservations.RestaurantId
     WHERE Reservations.ReservationDate > @start_date AND Reservations.ReservationDate <@end_date;
end;