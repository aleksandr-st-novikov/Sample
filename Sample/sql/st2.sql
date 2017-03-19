CREATE PROCEDURE [dbo].[GetPartsByCarId]
	@CarId int
AS
BEGIN
	SELECT * FROM [dbo].[Parts] WHERE ([CarId] = @CarId)
END