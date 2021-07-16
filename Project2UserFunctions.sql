CREATE FUNCTION OverAmount(
	@total MONEY
)
RETURNS TABLE AS
RETURN
	SELECT DepartmentName, TotalCost
	FROM Costs JOIN Departments ON Costs.DepartmentID = Departments.DepartmentID
	WHERE TotalCost > @total;
GO

CREATE FUNCTION PatientLookUpByLastName(
	@PatientLast varchar(50)
)
RETURNS TABLE AS
RETURN
	SELECT (LastName + ', ' + FirstName) as PatientName, DepartmentName, RoomNumber
	FROM Patient JOIN Departments ON Patient.DepartmentID = Departments.DepartmentID
	WHERE LastName = @PatientLast;
