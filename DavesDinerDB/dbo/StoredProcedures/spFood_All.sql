﻿CREATE PROCEDURE [dbo].[spFood_All]
AS
BEGIN
set nocount on;
select [Id], [Title], [Description], [Price] from dbo.Food

END

