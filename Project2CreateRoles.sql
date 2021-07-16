CREATE ROLE Administrator
EXEC sp_addrolemember db_accessadmin, Administrator
EXEC sp_addrolemember db_datareader, Administrator;
GO

CREATE ROLE DOCTOR
GRANT INSERT, UPDATE, DELETE ON Patient TO DOCTOR
GRANT SELECT, INSERT, UPDATE, DELETE ON Appointments TO DOCTOR
GRANT SELECT, INSERT, UPDATE, DELETE ON PatientMedRecords TO DOCTOR
GRANT SELECT, INSERT, UPDATE, DELETE ON Prescriptions TO DOCTOR
GRANT SELECT ON LabResults TO DOCTOR
GRANT SELECT ON EmployeeSchedule TO DOCTOR;
GO