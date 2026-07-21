DECLARE @reservation_id INT =5;

SELECT Orders.*,
       MenuItems.*
FROM Orders

JOIN OrderItems
ON OrderItems.OrderId = Orders.OrderID

JOIN MenuItems
ON MenuItems.ItemId = OrderItems.ItemId

WHERE Orders.ReservationId = @reservation_id

