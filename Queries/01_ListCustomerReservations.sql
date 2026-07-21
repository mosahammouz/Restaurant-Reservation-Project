DECLARE @customer_id INT = 10; -- snake_case is the best practice from uncle Google :)

SELECT * FROM Reservations
WHERE CustomerId = @customer_id;