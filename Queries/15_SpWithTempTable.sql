DROP PROCEDURE IF EXISTS sp_FutureReservationTables;
GO
CREATE PROCEDURE sp_FutureReservationTables
AS BEGIN
    CREATE TABLE #FutureTables (
        TableId INT,
        RestaurantId INT,
        ReservationDate DATE
    );
    INSERT INTO #FutureTables
    SELECT TableId,RestaurantId , ReservationDate FROM  Reservations
    WHERE ReservationDate > getdate();

    SELECT
        Restaurants.Name,
        Restaurants.PhoneNumber,
        #FutureTables.TableId,
        #FutureTables.ReservationDate

    FROM #FutureTables

             JOIN Restaurants
              ON #FutureTables.RestaurantId = Restaurants.RestaurantId;


end;
GO