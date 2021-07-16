CREATE VIEW WorksToday
AS
	SELECT (FirstName + ' ' + LastName) AS EmployeeName, StartTime, Endtime
	From Employees JOIN EmployeeSchedule ON Employees.EmployeeID = EmployeeSchedule.EmployeeID
	WHERE CAST(StartTime as date) = GETDATE();*/

CREATE VIEW PatientInsurance
AS
	SELECT (LastName + ', ' + FirstName) AS PatientName, InsuranceName, Coverages
	FROM Patient JOIN Insurance ON Patient.PatientID = Insurance.PatientID;

/*CREATE VIEW DepartmentRoomAndAttendingStaff
AS
	SELECT (v1.LastName + ', ' + v1.FirstName) AS PatientName, DepartmentName, RoomNumber, (v2.LastName + ', ' + v2.FirstName) AS AttendingStaffName
	FROM Patient v1 JOIN Departments ON v1.DepartmentID = Departments.DepartmentID
	JOIN Appointments ON v1.PatientID = Appointments.PatientID
	JOIN MedicalStaff ON Appointments.MedicalStaffID = MedicalStaff.MedicalStaffID
	JOIN Employees v2 ON MedicalStaff.EmployeeID = v2.EmployeeID;*

CREATE VIEW PatientTestResults
AS
	SELECT (LastName + ', ' + FirstName) AS PatientName, Type, Results, LabName
	FROM Patient JOIN LabResults ON Patient.PatientID = LabResults.PatientID
	JOIN LabDepartment ON LabResults.LabID = LabDepartment.LabID;
GO

CREATE VIEW FacilityVacancy
AS
	SELECT FacilityName, (MAX(Capacity)-COUNT(PatientID)) AS CurrentVacancy
	FROM Facility JOIN Patient ON Facility.FacilityID = Patient.FacilityID
	GROUP BY FacilityName;
GO