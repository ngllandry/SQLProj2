USE master;
GO

IF DB_ID('UMCDatabase') IS NOT NULL
	DROP DATABASE UMCDatabase;
GO

CREATE DATABASE UMCDatabase;
GO

USE UMCDatabase;

-- Table: Facility
CREATE TABLE Facility (
    FacilityID int  PRIMARY KEY IDENTITY,
    FacilityName varchar(50)  NOT NULL,
    Capacity int  NOT NULL,
    [Location] varchar(100)  NOT NULL
);


CREATE TABLE Departments (
    DepartmentID int  PRIMARY KEY IDENTITY,
    FacilityID int  REFERENCES Facility (FacilityID),
    DepartmentName varchar(50)  NOT NULL,
    Phone varchar(50)  NOT NULL
   );

-- Table: Patient
CREATE TABLE Patient (
    PatientID int  PRIMARY KEY IDENTITY,
    DepartmentID int REFERENCES Departments (DepartmentID),
    FacilityID int  REFERENCES Facility (FacilityID),
    FirstName varchar(50)  NOT NULL,
    LastName varchar(50)  NOT NULL,
    MiddleInitial varchar(2)  NULL,
    [Address] varchar(100)  NOT NULL,
    Phone varchar(50)  NOT NULL,
    Email varchar(50)  NOT NULL UNIQUE,
    RoomNumber int NULL
);

CREATE TABLE Appointments (
    AppointmentID int  PRIMARY KEY IDENTITY,
    PatientID int  REFERENCES Patient (PatientID),
    MedicalStaffID int  NOT NULL,
    AppointmentDesc varchar(200)  NOT NULL,
    StartTime smalldatetime  NOT NULL,
    EndTime smalldatetime  NOT NULL
);

-- Table: Insurance
CREATE TABLE Insurance (
    InsuranceID int  PRIMARY KEY IDENTITY,
    PatientID int  REFERENCES Patient (PatientID),
    InsuranceName varchar(50)  NOT NULL,
    Phone varchar(50)  NOT NULL,
    Coverages varchar(200)  NOT NULL
);

-- Table: Billing
CREATE TABLE Billing (
    BillingID int  PRIMARY KEY IDENTITY,
    PatientID int  REFERENCES Patient (PatientID),
    InsuranceID int  REFERENCES Insurance (InsuranceID),
    BillingCode varchar(50)  NOT NULL,
    Payer varchar(50)  NOT NULL,
    PaymentMethod varchar(50)  NOT NULL,
    CardNumber varchar(50)  NULL
    
);

-- Table: Costs
CREATE TABLE Costs (
    CostID int  PRIMARY KEY IDENTITY,
    DepartmentID int  REFERENCES Departments (DepartmentID),
    CostDescription varchar(200)  NOT NULL,
    TotalCost money  NOT NULL
);


-- Table: EmergencyContact
CREATE TABLE EmergencyContact (
    EmergencyContactID int  PRIMARY KEY IDENTITY,
    PatientID int  REFERENCES Patient (PatientID),
    FirstName varchar(50)  NOT NULL,
    LastName varchar(50)  NOT NULL,
    Address varchar(200)  NOT NULL,
    Phone varchar(50)  NOT NULL,
    Email varchar(50)  NOT NULL UNIQUE
);

-- Table: Employees
CREATE TABLE Employees (
    EmployeeID int  PRIMARY KEY IDENTITY,
    DepartmentID int  REFERENCES Departments (DepartmentID),
    FirstName varchar(50)  NOT NULL,
    LastName varchar(50)  NOT NULL,
    Address varchar(100)  NOT NULL,
    Phone varchar(50)  NOT NULL,
    Email varchar(50)  NOT NULL UNIQUE,
    Salary money  NOT NULL
);

-- Table: EmployeeSchedule
CREATE TABLE EmployeeSchedule (
    ScheduleID int  PRIMARY KEY IDENTITY,
    EmployeeID int  REFERENCES Employees (EmployeeID),
    StartTime smalldatetime  NOT NULL,
    EndTime smalldatetime  NOT NULL
);


-- Table: Equipment
CREATE TABLE Equipment (
    EquipmentID int PRIMARY KEY IDENTITY,
    DepartmentID int  REFERENCES Departments (DepartmentID),
    VendorID int  NOT NULL,
    EquipmentName varchar(50)  NOT NULL,
    EquipmentDescription varchar(200)  NOT NULL,
    InUse bit  NOT NULL,
    Operational bit  NOT NULL
);


-- Table: LabDepartment
CREATE TABLE LabDepartment (
    DepartmentID int REFERENCES Departments (DepartmentID),
	LabID int PRIMARY KEY IDENTITY,
    LabName varchar(50)  NOT NULL,
    LabDescription varchar(200)  NOT NULL
);

-- Table: LabResults
CREATE TABLE LabResults (
    LabResultID int  PRIMARY KEY IDENTITY,
    PatientID int  REFERENCES Patient (PatientID),
    LabID int  REFERENCES LabDepartment (LabID),
    [Type] varchar(50)  NOT NULL,
    Results varchar(200)  NOT NULL
	);

-- Table: MedicalStaff
CREATE TABLE MedicalStaff (
    MedicalStaffID int  PRIMARY KEY IDENTITY,
    EmployeeID int  REFERENCES Employees (EmployeeID),
    [Type] varchar(50)  NOT NULL,
    [Status] varchar(50)  NOT NULL,
    Position varchar(50)  NOT NULL
);



-- Table: PatientMedRecords
CREATE TABLE PatientMedRecords (
    RecordID int  PRIMARY KEY IDENTITY,
    PatientID int  REFERENCES Patient (PatientID),
    MedicalStaffID int  REFERENCES MedicalStaff (MedicalStaffID),
    [Weight] int  NOT NULL,
    CheckIn smalldatetime  NULL,
    CheckOut smalldatetime  NULL,
    Symptoms varchar(200)  NOT NULL,
    Medication varchar(200)  NULL,
    Hospitalization varchar(200)  NULL,
    Discharge varchar(200)  NULL
);

-- Table: PharmacyDepartment
CREATE TABLE PharmacyDepartment (
    DepartmentID int REFERENCES Departments (DepartmentID),
	PharmacyID int PRIMARY KEY IDENTITY,
    PharmacyName varchar(50)  NOT NULL
);

-- Table: Prescriptions
CREATE TABLE Prescriptions (
    PrescriptionID int  PRIMARY KEY IDENTITY,
    PatientID int REFERENCES Patient (PatientID),
    PharmacyID int REFERENCES PharmacyDepartment (PharmacyID),
    PrescriptionName varchar(50)  NOT NULL,
    Description varchar(50)  NOT NULL,
    PrescriberID int  NOT NULL
);

-- Table: SurgeryDepartment
CREATE TABLE SurgeryDepartment (
    DepartmentID int REFERENCES Departments (DepartmentID),
    SurgeryID int  PRIMARY KEY IDENTITY,
    Type varchar(50)  NOT NULL
);

-- Table: Vendors
CREATE TABLE Vendors (
    VendorID int  PRIMARY KEY IDENTITY,
    VendorName varchar(50)  NOT NULL,
    Phone varchar(50)  NOT NULL,
    Address varchar(100)  NOT NULL,
    Email varchar(50)  NOT NULL UNIQUE
);

-- Table: Visitors
CREATE TABLE Visitors (
    VisitorID int  PRIMARY KEY IDENTITY,
    PatientID int  REFERENCES Patient (PatientID),
    FirstName varchar(50)  NOT NULL,
    LastName varchar(50)  NOT NULL,
    EntryTime smalldatetime  NULL,
    ExitTime smalldatetime  NULL
);
