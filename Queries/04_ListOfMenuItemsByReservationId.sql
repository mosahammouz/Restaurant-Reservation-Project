DECLARE @reservation_id INT =18;

SELECT Reservations.ReservationId,
       MenuItems.*
FROM Reservations

JOIN Orders
ON Orders.ReservationId = Reservations.ReservationId

JOIN OrderItems
ON OrderItems.OrderId = Orders.OrderId

JOIN MenuItems
ON MenuItems.ItemId = OrderItems.ItemId

WHERE Reservations.ReservationId = @reservation_id;