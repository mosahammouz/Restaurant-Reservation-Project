DROP  PROCEDURE IF EXISTS sp_AddNewOrder;
GO
CREATE PROCEDURE sp_AddNewOrder(@reservation_id INT , @employee_id INT, @order_date DATE , @total_amount DECIMAL(10,2))
--Purpose: Streamline the process of adding a new order.
AS BEGIN
    IF NOT EXISTS(SELECT 1 FROM Reservations WHERE ReservationId  =@reservation_id)
    BEGIN
        THROW 50001, 'Reservation does not exist', 1;
    end

    IF NOT EXISTS(SELECT 1 FROM Employees WHERE EmployeeId  =@employee_id)
        BEGIN
            THROW 2, 'Employee does not exist', 1;
        end

   INSERT INTO Orders(ReservationId, EmployeeId, OrderDate, TotalAmount)
                VALUES (@reservation_id,@employee_id,@order_date,@total_amount)
    SELECT SCOPE_IDENTITY() AS [New Order Id];
end
