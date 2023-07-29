CREATE PROCEDURE [dbo].[spOrder_UpdateName]
	@Id int,
	@OrderName nvarchar(50)
AS
BEGIN 

	set nocount on;

		UPDATE dbo.[Order]
		set OrderName = @OrderName
		WHERE Id = @Id;

END
