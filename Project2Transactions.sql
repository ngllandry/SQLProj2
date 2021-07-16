BEGIN TRANSACTION DeletePastAppointments
DELETE FROM Appointments WHERE EndTime < GETDATE()
COMMIT TRAN;
GO

BEGIN TRANSACTION DeleteVisitors
DELETE FROM Visitors WHERE ExitTime < GETDATE()
COMMIT TRAN;
GO

SELECT * FROM Appointments;
SELECT * FROM Visitors;