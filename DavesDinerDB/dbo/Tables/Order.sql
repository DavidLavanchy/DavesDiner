CREATE TABLE [dbo].[Order]
(
	[Id] INT NOT NULL PRIMARY KEY,
	OrderName nvarchar(50) not null,
	OrderDate datetime2(7) not null,
	FoodId int not null,
	Quantity int not null,
	Total money not null
	CONSTRAINT FK_Order_FoodId FOREIGN KEY (FoodId) REFERENCES Food(Id)
)
