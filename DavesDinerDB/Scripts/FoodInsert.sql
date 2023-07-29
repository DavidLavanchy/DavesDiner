/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

if not exists (SELECT * FROM dbo.Food)
begin
insert into dbo.Food(Title, Description, Price)
VALUES ('Cheeseburger Meal', 'Cheeseburger, Fries, and Drink', 5.95),
        ('Chilidog meal', 'two chilidogs, Fries, and Drink', 4.15),
        ('Vegan Meal', 'large salad and water', 1.95);
end
