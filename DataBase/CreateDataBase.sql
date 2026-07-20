IF NOT EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'Reservations'
)
    BEGIN
        CREATE DATABASE Reservations;
    END;
GO