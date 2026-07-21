CREATE VIEW ReservationReportView
AS
    SELECT Reservations.*,
           Customers.FirstName, Customers.LastName,Customers.PhoneNumber,
           Restaurants.Name
    FROM Reservations

    JOIN Customers
    ON Reservations.CustomerId = Customers.CustomerId

    JOIN Restaurants
    ON  Reservations.RestaurantId = Restaurants.RestaurantId
GO

