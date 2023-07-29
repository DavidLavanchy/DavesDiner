CREATE PROCEDURE [dbo].[spOrder_GetById]
	@Id int
AS
BEGIN
set nocount on;

	SELECT [Id], [OrderName], [OrderDate], [FoodId], [Quantity], [Total] FROM dbo.[Order]
	WHERE Id = @Id;
END
