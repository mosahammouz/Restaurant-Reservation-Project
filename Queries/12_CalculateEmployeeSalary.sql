DROP FUNCTION IF EXISTS fn_CalculateEmployeeSalary;
GO

CREATE FUNCTION fn_CalculateEmployeeSalary (@employee_id INT)
    RETURNS DECIMAL(10,2)
AS
BEGIN

    DECLARE @ans DECIMAL(10,2);

    SELECT @ans =
           COUNT(Orders.OrderId) *
           CASE
               WHEN Position = 'VIPOrdersWaiter' THEN 5
               WHEN Position = 'StandardWaiter' THEN 4
               WHEN Position = 'AssistantWaiter' THEN 3
               ELSE 0
               END

    FROM Employees

             JOIN Orders
            ON Employees.EmployeeId = Orders.EmployeeId

    WHERE Employees.EmployeeId = @employee_id

    GROUP BY
        Employees.EmployeeId,
        Position;

    RETURN @ans;

END;
GO