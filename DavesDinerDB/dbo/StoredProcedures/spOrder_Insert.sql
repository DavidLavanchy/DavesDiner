﻿CREATE PROCEDURE [dbo].[spOrder_Insert]
	@OrderName nvarchar(50),
	@OrderDate datetime2(7),
	@FoodId int,
	@Quantity int,
	@Total money,
	@Id int output
AS
BEGIN
set nocount on;

insert into dbo.[Order] (OrderName, OrderDate, FoodId, Quantity, Total)
Values (@OrderName, @OrderDate, @FoodId, @Quantity, @Total)
SET @Id = SCOPE_IDENTITY();
END
