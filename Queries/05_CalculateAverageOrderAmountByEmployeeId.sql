DECLARE @employee_id INT =14;

SELECT AVG(TotalAmount) AS [Average order amount by employee id]
FROM Orders
WHERE EmployeeId =@employee_id;
