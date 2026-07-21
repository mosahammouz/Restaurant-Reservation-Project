;WITH ReservationsOrderMoreThan2 as
    (
     SELECT ReservationId,

            COUNT(OrderId) AS [Number Of Orders]
     FROM Orders
     GROUP BY ReservationId
     HAVING COUNT(OrderId) >= 2
    )

SELECT Orders.*
FROM Orders
JOIN ReservationsOrderMoreThan2
ON ReservationsOrderMoreThan2.ReservationId = Orders.ReservationId;