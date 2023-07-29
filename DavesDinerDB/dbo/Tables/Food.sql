CREATE TABLE [dbo].[Food]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Title] nvarchar(50) NOT NULL,
	Description nvarchar(250) not null,
	Price money not null

)
