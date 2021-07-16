CREATE PROCEDURE AppointmentsAtTime @time smalldatetime
AS
SELECT (v1.LastName + ', ' + v1.FirstName) AS PatientName, StartTime, EndTime, AppointmentDesc, (v2.LastName + ', ' + v2.FirstName) AS MedicalStaffName
FROM Patient v1 JOIN Appointments ON v1.PatientID = Appointments.PatientID
JOIN MedicalStaff ON Appointments.MedicalStaffID = MedicalStaff.MedicalStaffID
JOIN Employees v2 ON MedicalStaff.EmployeeID = v2.EmployeeID
WHERE DATEADD(minute, 30, @time) >= StartTime AND @time < EndTime;
GO

CREATE PROCEDURE PatientsInDepartment @depName varchar(50)
AS
BEGIN
SELECT DepartmentName, COUNT(PatientID) AS PatientCount
FROM Departments JOIN Patient ON Departments.DepartmentID = Patient.DepartmentID
WHERE @depName = DepartmentName
GROUP BY DepartmentName;
END
BEGIN
IF @@ROWCOUNT = 0
BEGIN
	THROW 50000, 'Invalid department name or department has no patients.', 1;
END
END
GO
