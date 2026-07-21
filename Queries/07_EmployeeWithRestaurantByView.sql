CREATE VIEW EmployeesRestaurantsView
AS
    SELECT Employees.*,
           Restaurants.Name, Restaurants.Address,Restaurants.PhoneNumber
    FROM Employees
    JOIN Restaurants
ON Employees.RestaurantId = Restaurants.RestaurantId
GO