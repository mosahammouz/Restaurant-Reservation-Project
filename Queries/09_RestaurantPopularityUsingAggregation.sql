SELECT Name,
       PhoneNumber,
       COUNT(Reservations.ReservationId) AS [Reservation Frequency],
       RANK() OVER (ORDER BY COUNT(Reservations.ReservationId) DESC) AS [Restaurant Rank]

FROM Restaurants

JOIN Reservations
ON Restaurants.RestaurantId = Reservations.RestaurantId

GROUP BY Name, PhoneNumber -- to know the number of Reservations for each restaurant, not for distinct ones