DECLARE @month INT = 7;

SELECT
    Restaurants.Name,
    MenuItems.ItemId,
    MenuItems.Name,
    MenuItems.Price,
    MONTH(Orders.OrderDate) AS [Month chosen],

    ROW_NUMBER() OVER
        (
        PARTITION BY Restaurants.RestaurantId -- rank according to the Restaurant Id, so the restarting of ranking due to this
        ORDER BY COUNT(OrderItems.ItemId) DESC
        ) AS [Restaurant Rank]

FROM Orders

         JOIN OrderItems
         ON Orders.OrderId = OrderItems.OrderId

         JOIN MenuItems
         ON OrderItems.ItemId = MenuItems.ItemId

         JOIN Reservations
         ON Orders.ReservationId = Reservations.ReservationId

         JOIN Restaurants
         ON Reservations.RestaurantId = Restaurants.RestaurantId

WHERE MONTH(Orders.OrderDate) = @month

GROUP BY
    Restaurants.RestaurantId,
    Restaurants.Name,
    MenuItems.ItemId,
    MenuItems.Name,
    MenuItems.Price,
    MONTH(Orders.OrderDate);