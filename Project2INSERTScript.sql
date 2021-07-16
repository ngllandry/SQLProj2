USE UMCDatabase;
GO

SET IDENTITY_INSERT Facility ON;

INSERT INTO Facility (FacilityID, FacilityName, Capacity, Location) VALUES
	(1, 'University Medical Center', 1000, 'Syracuse, NY');

SET IDENTITY_INSERT Facility OFF;

SET IDENTITY_INSERT Departments ON;

INSERT INTO Departments (DepartmentID, FacilityID, DepartmentName, Phone) VALUES
	(1, 1, 'Urgent Care', '(111) 111-1111'),
	(2, 1, 'Emergency Room', '(111) 111-1122'),
	(3, 1, 'Pharmacy', '(111) 111-1133'),
	(4, 1, 'Surgery', '(111) 111-1144'),
	(5, 1, 'Lab', '(111) 111-1155');

SET IDENTITY_INSERT Departments OFF;

SET IDENTITY_INSERT Patient ON;

INSERT INTO Patient (PatientID, DepartmentID, FacilityID, FirstName, LastName, MiddleInitial, Address, Phone, Email, RoomNumber) VALUES
	(1, 1, 1, 'Jason', 'Bourne', NULL, '1 Comstock Ave, Syracuse, NY', '(222) 222-2222', 'jasonbourne@gmail.com', 1),
	(2, 1, 1, 'Matt', 'Damon', NULL, '2 Comstock Ave, Syrcause, NY', '(222) 222-2211', 'mattdamon@gmail.com', 2),
	(3, 2, 1, 'Nick', 'Landry', 'G.', '1 Waverly Ave, Syracuse, NY', '(222) 222-2233', 'nicklandry@hotmail.com', 3),
	(4, 2, 1, 'Aaron', 'Capurro', NULL, '2 Marshall Street, Syracuse, NY', '(222) 222-2244', 'aaroncapurro@yahoo.com', 4),
	(5, 4, 1, 'Marc', 'Vasquez', NULL, '3 Euclid Ave, Syracuse, NY', '(222) 222-2255', 'marcvasquez@gmail.com', 5);

SET IDENTITY_INSERT Patient OFF;

SET IDENTITY_INSERT Appointments ON;

INSERT INTO Appointments (AppointmentID, PatientID, MedicalStaffID,AppointmentDesc, StartTime, EndTime) VALUES
	(1, 1, 1, 'Stomach ache for about a week. Light fever.', '2021-5-18 12:00:00', '2021-5-18 12:30:00'),
	(2, 2, 1, 'Chills and body aches', '2021-5-18 13:00:00', '2021-5-18 13:30:00'),
	(3, 5, 2, 'Brain surgery', '2021-5-19 09:00:00', '2021-5-19 10:00:00');

SET IDENTITY_INSERT Appointments OFF;

SET IDENTITY_INSERT Insurance ON;

INSERT INTO Insurance (InsuranceID, PatientID, InsuranceName, Phone, Coverages) VALUES
	(1, 1, 'Blue Cross' , '(333) 333-1111', 'Full'),
	(2, 2, 'Best Insurance', '(132) 123-1234', 'Preventative and wellness'),
	(3, 3, 'Blue Cross', '(333) 333-1111', 'Emergency'),
	(4, 4, 'Geico Health', '(901) 901-0901', 'Full'),
	(5, 5, 'StateFarm', '(333) 333-1133', 'Hospitalization');

SET IDENTITY_INSERT Insurance OFF;

SET IDENTITY_INSERT Billing ON;

INSERT INTO Billing (BillingID, PatientID, InsuranceID, BillingCode, Payer, PaymentMethod, CardNumber) VALUES
	(1, 1, 1, 10002, 'Insurance', 'Insurance', NULL),
	(2, 2, 2, 10026, 'Self', 'credit card', '1111-2222-3333-4444'),
	(3, 3, 3, 20109, 'Insurance', 'Insurance', NULL),
	(4, 4, 4, 50212, 'Insurance', 'Insurance', NULL),
	(5, 5, 5, 36281, 'Relative', 'credit card', '1234-1234-1234-1234');

SET IDENTITY_INSERT BILLING OFF;

SET IDENTITY_INSERT COSTS ON;

INSERT INTO Costs (CostID, DepartmentID, CostDescription, TotalCost) VALUES
	(1, 4, 'New surgery utensils' , 2000),
	(2, 3, 'prescription containers', 1000),
	(3, 5, 'new beakers', 2000);

SET IDENTITY_INSERT COSTS OFF;

SET IDENTITY_INSERT EmergencyContact ON;

INSERT INTO EmergencyContact (EmergencyContactID, PatientID, FirstName, LastName, Address, Phone, Email) VALUES
	(1, 4, 'Joseph', 'Capurro', '6 Waterway Place, Chicago, IL', '(444) 444-4411', 'josephcapurro@gmail.com'),
	(2, 2, 'Lawrence', 'Lauren', '426 Deerfield Ave, Berkeley, CA', '(444) 441-4422', 'lawrencelauren@yahoo.com'),
	(3, 1, 'George', 'Jungle', '909 Jungle Street, Syracuse, NY', '(444) 451-5554', 'georgeofthejungle@jungle.com');

SET IDENTITY_INSERT EmergencyContact OFF;

SET IDENTITY_INSERT Employees ON;

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Address, Phone, Email, Salary) VALUES
	(1, 1, 'Nathan', 'Correll', '52 Cunningham Drive, Syracuse, NY', '(555) 555-5115', 'nathancorrell@hotmail.com', 60000),
	(2, 4, 'Dominic', 'Edwall', '6 Euclid Ave, Syracuse, NY', '(555) 555-5522', 'dominicedwall@yahoo.com', 200000),
	(3, 2, 'Emily', 'Jones', '42 Hinge Place, Syracuse, NY', '(555) 555-5533', 'emilyjones@gmail.com', 73000),
	(4, 3, 'Keith', 'Samsa', '51 Curry Street, Syracuse, NY', '(555) 555-5544', 'keithsamsa@yahoo.com', 50000),
	(5, 5, 'Barbara', 'Jean', '89 Mondstat Ave, Syracuse, NY', '(555) 555-5555', 'barbarajean@gmail.com', 120000);

SET IDENTITY_INSERT Employees OFF;

SET IDENTITY_INSERT EmployeeSchedule ON;

INSERT INTO EmployeeSchedule (ScheduleID, EmployeeID, StartTime, EndTime) VALUES
	(1, 1, '2021-05-19 09:00:00', '2021-05-19 17:00:00'),
	(2, 2, '2021-05-19 05:00:00', '2021-05-19 16:00:00'),
	(3, 3, '2021-05-20 10:00:00', '2021-05-20 19:00:00'),
	(4, 4, '2021-05-19 12:00:00', '2021-05-19 23:00:00'),
	(5, 5, '2021-05-20 06:00:00', '2021-05-20 14:00:00');

SET IDENTITY_INSERT EmployeeSchedule OFF;

SET IDENTITY_INSERT Equipment ON;

INSERT INTO Equipment (EquipmentID, DepartmentID, VendorID, EquipmentName, EquipmentDescription, InUse, Operational) VALUES
	(1, 2, 1, 'Ventilator', 'Assists breathing by pumping oxygen into airways', 0, 1),
	(2, 1, 2, 'Heartbeat Monitor', 'Displays heartbeat of connected patient', 1, 1),
	(3, 4, 3, 'Da Vinci Surgery Robot', 'Surgery robot capable of precise operations', 0, 0);

SET IDENTITY_INSERT Equipment OFF;

SET IDENTITY_INSERT LabDepartment ON;

INSERT INTO LabDepartment (DepartmentID, LabID, LabName, LabDescription) VALUES
	(5, 1, 'Bloodwork Lab', 'Tests for various things concerning blood'),
	(5, 2, 'COVID-19 Lab', 'Tests for COVID-19'),
	(5, 3, 'STD Lab', 'Tests for STDs');

SET IDENTITY_INSERT LabDepartment OFF;

SET IDENTITY_INSERT LabResults ON;

INSERT INTO LabResults (LabResultID, PatientID, LabID, Type, Results) VALUES
	(1, 1, 2, 'COVID-19 Test', 'Negative'),
	(2, 2, 1, 'Vitamin Level Test', 'Vitamin D deficiancy'),
	(3, 5, 3, 'HIV Test', 'Negative');

SET IDENTITY_INSERT LabResults OFF;

SET IDENTITY_INSERT MedicalStaff ON;

INSERT INTO MedicalStaff (MedicalStaffID, EmployeeID, Type, Status, Position) VALUES
	(1, 2, 'Surgeon', 'Attending', 'Head brain surgeon'),
	(2, 3, 'Nurse/Assistant', 'Visiting', 'General nurse'),
	(3, 1, 'Doctor', 'Attending', 'On-Call doctor');

SET IDENTITY_INSERT MedicalStaff OFF;

SET IDENTITY_INSERT PatientMedRecords ON;

INSERT INTO PatientMedRecords (RecordID, PatientID, MedicalStaffID, Weight, CheckIn, CheckOut, Symptoms, Medication, Hospitalization, Discharge) VALUES
	(1, 1, 3, 180, '2021-05-19 11:00:00', NULL, 'Stomach ache and light fever for about a week', NULL, NULL, NULL),
	(2, 2, 3, 180, '2021-05-19 12:00:00', NULL, 'Chill and body aches', NULL, NULL, NULL),
	(3, 5, 1, 200, '2021-05-19 10:00:00', NULL, 'Major blunt head trauma', NULL, 'Hospitalized', NULL);

SET IDENTITY_INSERT PatientMedRecords OFF;

SET IDENTITY_INSERT PharmacyDepartment ON;

INSERT INTO PharmacyDepartment ( DepartmentID, PharmacyID, PharmacyName) VALUES
	(3, 1, 'Pain Medication'),
	(3, 2, 'Anti-depressants'),
	(3, 3, 'Antihistamines');

SET IDENTITY_INSERT PharmacyDepartment OFF;

SET IDENTITY_INSERT Prescriptions ON;

INSERT INTO Prescriptions (PrescriptionID, PatientID, PharmacyID, PrescriberID, PrescriptionName, Description) VALUES
	(1, 1, 1, 3, 'Pain Meds', 'Codeine'),
	(2, 5, 1, 1, 'Pain Meds', 'Opioids'),
	(3, 2, 3, 3, 'Anti-anxiety', 'Hydroxyzine');

SET IDENTITY_INSERT Prescriptions OFF;

SET IDENTITY_INSERT SurgeryDepartment ON;

INSERT INTO SurgeryDepartment (DepartmentID, SurgeryID, Type) VALUES
	(4, 1, 'Brain'),
	(4, 2, 'Heart'),
	(4, 3, 'Limb');

SET IDENTITY_INSERT SurgeryDepartment OFF;

SET IDENTITY_INSERT Vendors ON;

INSERT INTO Vendors ( VendorID, VendorName, Phone, Address, Email) VALUES
	(1, 'Venting INC', '(666) 666-6666' , '6 Waverly Place, New York, NY', 'ventinginc@gmail.com'),
	(2, 'Healthy Hearts', '(666) 666-6611', '736 Euclid Ave, Syracuse, NY', 'hhearts@gmail.com'),
	(3, 'Da Vinci Tech', '(666) 666-6622', '102 Generation Street, San Francisco, CA', 'davincitech@yahoo.com');

SET IDENTITY_INSERT Vendors OFF;

SET IDENTITY_INSERT Visitors ON;

INSERT INTO Visitors (VisitorID, PatientID, FirstName, LastName, EntryTime, ExitTime) VALUES
	(1, 5, 'James', 'Vasquez', '2021-05-18 12:00:00', '2021-05-18 12:00:00');

SET IDENTITY_INSERT Visitors OFF;
