-- CREATE DATABASE MedicalDB;

CREATE TABLE Hospital
(
    HospitalCode INT NOT NULL PRIMARY KEY,
    Name         VARCHAR(50),
    Address      VARCHAR(50),
    Phone        VARCHAR(50),
    BedCount     INT
);

CREATE TABLE Chamber
(
    HospitalCode  INT NOT NULL,
    ChamberNumber INT,
    Name          VARCHAR(50),
    BedCount      INT,
    PRIMARY KEY (HospitalCode, ChamberNumber),
    FOREIGN KEY (HospitalCode) REFERENCES Hospital (HospitalCode) on delete cascade
);

CREATE TABLE Staff
(
    HospitalCode  INT NOT NULL,
    ChamberNumber INT,
    LastName      VARCHAR(50),
    Position      VARCHAR(50) CHECK (Position IN ('медсестра', 'няня', 'сиделка', 'санитар')),
    Shift         VARCHAR(50) CHECK (Shift IN ('утренняя', 'вечерняя', 'ночная')),
    Salary        INT CHECK (Salary BETWEEN 1000 AND 10000),
    FOREIGN KEY (HospitalCode, ChamberNumber) REFERENCES Chamber (HospitalCode, ChamberNumber)
);

CREATE TABLE Doctor
(
    DoctorCode   INT PRIMARY KEY,
    HospitalCode INT NOT NULL,
    LastName     VARCHAR(50),
    Specialty    VARCHAR(50),
    FOREIGN KEY (HospitalCode) REFERENCES Hospital (HospitalCode)
);

CREATE TABLE Patient
(
    RegistrationNumber INT PRIMARY KEY,
    LastName           VARCHAR(50),
    Address            VARCHAR(50),
    DateOfBirth        DATE CHECK (DateOfBirth > '1900-01-01'),
    gender             VARCHAR(50) CHECK (gender IN ('мужской', 'женский')),
    PolicyNumber       INT
);

CREATE TABLE Diagnosis
(
    RegistrationNumber INT NOT NULL,
    DiagnosisType      VARCHAR(50),
    Complications      VARCHAR(50),
    Warning            VARCHAR(50),
    FOREIGN KEY (RegistrationNumber) REFERENCES Patient (RegistrationNumber) on delete cascade
);

CREATE TABLE Laboratory
(
    LaboratoryCode SERIAL PRIMARY KEY,
    Name           VARCHAR(50),
    Address        VARCHAR(50),
    Phone          VARCHAR(50)
);

CREATE TABLE Analysis
(
    RegistrationNumber INT,
    LaboratoryCode     INT NOT NULL,
    AnalysisType       VARCHAR(50),
    Date               DATE,
    Time               TIME,
    DirectionNumber    INT,
    Status             VARCHAR(50),
    FOREIGN KEY (RegistrationNumber) REFERENCES Patient (RegistrationNumber) on delete cascade,
    FOREIGN KEY (LaboratoryCode) REFERENCES Laboratory (LaboratoryCode) on delete cascade
);

CREATE TABLE HospitalLaboratory
(
    HospitalCode   INT,
    LaboratoryCode INT,
    PRIMARY KEY (HospitalCode, LaboratoryCode),
    FOREIGN KEY (HospitalCode) REFERENCES Hospital (HospitalCode) on delete cascade,
    FOREIGN KEY (LaboratoryCode) REFERENCES Laboratory (LaboratoryCode) on delete cascade
);

CREATE TABLE DoctorPatient
(
    DoctorCode         INT,
    RegistrationNumber INT,
    PRIMARY KEY (DoctorCode, RegistrationNumber),
    FOREIGN KEY (DoctorCode) REFERENCES Doctor (DoctorCode) on delete cascade,
    FOREIGN KEY (RegistrationNumber) REFERENCES Patient (RegistrationNumber) on delete cascade
);

CREATE TABLE Placement
(
    HospitalCode       INT,
    ChamberNumber      INT,
    BedNumber          INT,
    RegistrationNumber INT,
    PRIMARY KEY (HospitalCode, ChamberNumber, BedNumber),
    FOREIGN KEY (HospitalCode, ChamberNumber) REFERENCES Chamber (HospitalCode, ChamberNumber) on delete cascade,
    FOREIGN KEY (RegistrationNumber) REFERENCES Patient (RegistrationNumber) on delete cascade
);

CREATE TABLE HospitalPhone
(
    HospitalCode INT         ,
    Phone        VARCHAR(50) ,
    PRIMARY KEY (HospitalCode, Phone),
    FOREIGN KEY (HospitalCode) REFERENCES Hospital (HospitalCode) on delete cascade
);

CREATE TABLE LaboratoryPhone
(
    LaboratoryCode INT         ,
    Phone          VARCHAR(50) ,
    PRIMARY KEY (LaboratoryCode, Phone),
    FOREIGN KEY (LaboratoryCode) REFERENCES Laboratory (LaboratoryCode) on delete cascade
);
