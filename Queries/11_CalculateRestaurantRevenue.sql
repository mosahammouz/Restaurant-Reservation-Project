DROP FUNCTION IF EXISTS fn_CalculateRevenue;
GO

CREATE FUNCTION fn_CalculateRevenue (@restaurant_id INT)
RETURNS INT
AS BEGIN

    DECLARE @ans DECIMAL(10,2);
    SELECT  @ans = SUM(Orders.TotalAmount)
    FROM Orders

    JOIN Employees
    ON Orders.EmployeeId = Employees.EmployeeId

    WHERE Employees.RestaurantId = @restaurant_id
    RETURN @ans
end