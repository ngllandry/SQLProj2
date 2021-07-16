DROP TRIGGER IF EXISTS NewPatientInsert;
GO
CREATE TRIGGER NewPatientInsert ON Patient INSTEAD OF INSERT
AS BEGIN
	DECLARE @facID int;
	DECLARE @depID int;
	DECLARE @firstname varchar(50);
	DECLARE @lastname varchar(50);
	DECLARE @middleinit varchar(2);
	DECLARE @address varchar(100);
	DECLARE @phone varchar(50);
	DECLARE @email varchar(50);
	IF @facID IS NULL SET @facID = 1;
	IF @depID IS NULL SET @depID = 1;
	INSERT INTO Patient (DepartmentID, FacilityID, FirstName, LastName, MiddleInitial, Address, Phone, Email) VALUES
		(@depID, @facID, @firstname, @lastname, @middleinit, @address, @phone, @email);
END;
