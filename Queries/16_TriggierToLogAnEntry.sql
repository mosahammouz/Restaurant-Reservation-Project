CREATE TRIGGER tg_AfterReservationInsert
    ON Reservations
    AFTER INSERT
    AS
BEGIN

    INSERT INTO AuditLog
    (
        RestaurantId,
        TableId,
        ReservationDate,
        ChangeDate
    )

    SELECT
        RestaurantId,
        TableId,
        ReservationDate,
        GETDATE()
    FROM inserted; --special temporary table created automatically by SQL Server inside a trigger.

END;
GO