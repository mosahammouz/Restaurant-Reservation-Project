DECLARE @i INT =1;
WHILE @i <= 50
BEGIN
    INSERT INTO Restaurants(Name, Address, PhoneNumber, OpeningHours)
    VALUES (
            CONCAT('Restaurant',@i),
            CONCAT('City ', @i),
            CONCAT('059900', @i),
            '09:00 - 23:00'
           );
    SET @i = @i+1;
end
GO

---------------------------
DECLARE @i1 INT =1;
WHILE  @i1 <=400
BEGIN
    INSERT INTO Customers(FirstName, LastName, Email, PhoneNumber)
    VALUES
        (
         CONCAT('Customer', @i1),
        CONCAT('Surname',@i1),
        CONCAT('customer', @i1, '@gmail.com'),
        CONCAT('059800', @i1)
        );
    SET @i1 = @i1+1;
end
----------------------------
DECLARE @i2 INT = 1;

WHILE @i2 <= 100
    BEGIN
        INSERT INTO Employees
        (
            RestaurantId,
            FirstName,
            LastName,
            Position
        )
        VALUES
            (
                ((@i2 - 1) % 50) + 1,
                CONCAT('Employee', @i2),
                'Ali',
                'Waiter'
            );

        SET @i2 = @i2 + 1;
    END;
GO
-----------------------------
DECLARE @i3 INT = 1;

WHILE @i3 <= 100
    BEGIN
        INSERT INTO Tables
        (
            RestaurantId,
            Capacity
        )
        VALUES
            (
                ((@i3 - 1) % 50) + 1,
                ((@i3 % 6) + 2)
            );

        SET @i3 = @i3 + 1;
    END;
GO
--------------------------------
DECLARE @i4 INT = 1;

WHILE @i4 <= 1000
    BEGIN
        INSERT INTO MenuItems
        (
            RestaurantId,
            Name,
            Description,
            Price
        )
        VALUES
            (
                ((@i4 - 1) % 50) + 1,
                CONCAT('Menu Item ', @i4),
                'Delicious meal',
                ROUND(RAND() * 50 + 5,2)
            );

        SET @i4 = @i4 + 1;
    END;
GO
-------------------------------------
DECLARE @i5 INT = 1;

WHILE @i5 <= 500
    BEGIN
        INSERT INTO Reservations
        (
            CustomerId,
            RestaurantId,
            TableId,
            ReservationDate,
            PartySize
        )
        VALUES
            (
                ((@i5 - 1) % 400) + 1,
                ((@i5 - 1) % 50) + 1,
                ((@i5 - 1) % 100) + 1,
                DATEADD(DAY,@i5,'2026-01-01'),
                ((@i5 % 5)+1)
            );

        SET @i5 = @i5 + 1;
    END;
GO
----------------------------------------------
DECLARE @i6 INT = 1;

WHILE @i6 <= 500
    BEGIN
        INSERT INTO Orders
        (
            ReservationId,
            EmployeeId,
            OrderDate,
            TotalAmount
        )
        VALUES
            (
                @i6,
                ((@i6 - 1) % 100) + 1,
                GETDATE(),
                100
            );

        SET @i6= @i6 + 1;
    END;
GO
-----------------------------------
DECLARE @i7 INT = 1;

WHILE @i7 <= 1500
    BEGIN
        INSERT INTO OrderItems
        (
            OrderId,
            ItemId,
            Quantity
        )
        VALUES
            (
                ((@i7 - 1) % 500) + 1,
                ((@i7 - 1) % 1000) + 1,
                ((@i7 % 5)+1)
            );

        SET @i7 = @i7 + 1;
    END;
GO