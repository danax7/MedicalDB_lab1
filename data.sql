INSERT INTO Hospital (HospitalCode, Name, Address, Phone, BedCount)
VALUES (1, 'City Hospital', '123 Main Street', '123-456-7890', 100),
       (2, 'County Hospital', '456 Elm Street', '987-654-3210', 150),
       (3, 'Community Hospital', '789 Oak Street', '555-555-5555', 75),
       (4, 'General Hospital', '101 Pine Street', '222-333-4444', 200);

-- Добавление данных в таблицу Chamber
INSERT INTO Chamber (HospitalCode, ChamberNumber, Name, BedCount)
VALUES (1, 101, 'Pediatrics', 20),
       (1, 102, 'Surgery', 15),
       (2, 201, 'Internal Medicine', 30),
       (2, 202, 'Obstetrics', 25),
       (3, 301, 'Cardiology', 10),
       (3, 302, 'Orthopedics', 15),
       (4, 401, 'Emergency', 40),
       (4, 402, 'Neurology', 25);

-- Добавление данных в таблицу Staff
INSERT INTO Staff (HospitalCode, ChamberNumber, LastName, Position, Shift, Salary)
VALUES (1, 101, 'Smith', 'медсестра', 'утренняя', 3500),
       (1, 101, 'Johnson', 'медсестра', 'утренняя', 3400),
       (2, 201, 'Williams', 'медсестра', 'вечерняя', 3700),
       (2, 201, 'Jones', 'сиделка', 'вечерняя', 3000),
       (3, 301, 'Brown', 'медсестра', 'ночная', 3800),
       (3, 302, 'Davis', 'санитар', 'утренняя', 2500),
       (4, 401, 'Miller', 'медсестра', 'ночная', 3600),
       (4, 401, 'Wilson', 'сиделка', 'ночная', 2900);

-- Добавление данных в таблицу Doctor
INSERT INTO Doctor (DoctorCode, HospitalCode, LastName, Specialty)
VALUES (1, 1, 'Anderson', 'Педиатр'),
       (2, 1, 'Clark', 'Хирург'),
       (3, 2, 'Hall', 'Кардиолог'),
       (4, 2, 'Lee', 'Акушер-гинеколог');

-- Добавление данных в таблицу Patient
INSERT INTO Patient (RegistrationNumber, LastName, Address, DateOfBirth, gender, PolicyNumber)
VALUES (1001, 'Wilson', '123 Elm Street', '1990-05-15', 'мужской', 12345),
       (1002, 'Smith', '456 Oak Street', '1985-10-20', 'женский', 54321),
       (1003, 'Johnson', '789 Pine Street', '2000-02-10', 'мужской', 98765),
       (1004, 'Brown', '101 Maple Street', '1998-08-05', 'женский', 67890);

-- Добавление данных в таблицу Diagnosis
INSERT INTO Diagnosis (RegistrationNumber, DiagnosisType, Complications, Warning)
VALUES (1001, 'Простуда', 'Нет', 'Лечение на дому'),
       (1002, 'Аппендицит', 'Есть', 'Неотложная операция'),
       (1003, 'Грипп', 'Нет', 'Покой и лекарства'),
       (1004, 'Перелом руки', 'Есть', 'Наложение гипса');

-- Добавление данных в таблицу Laboratory
INSERT INTO Laboratory (LaboratoryCode, Name, Address, Phone)
VALUES (1, 'City Lab', '123 Main Street', '123-456-7890'),
       (2, 'County Lab', '456 Elm Street', '987-654-3210'),
       (3, 'Community Lab', '789 Oak Street', '555-555-5555'),
       (4, 'General Lab', '101 Pine Street', '222-333-4444');

-- Добавление данных в таблицу Analysis
INSERT INTO Analysis (RegistrationNumber, LaboratoryCode, AnalysisType, Date, Time, DirectionNumber, Status)
VALUES (1001, 1, 'Анализ крови', '2019-01-01', '10:00', 123, 'Завершен'),
       (1002, 2, 'Анализ крови', '2019-01-02', '11:00', 234, 'Завершен'),
       (1003, 3, 'Анализ крови', '2019-01-03', '12:00', 345, 'Завершен'),
       (1004, 4, 'Анализ крови', '2019-01-04', '13:00', 456, 'Завершен');

-- Добавление данных в таблицу HospitalLaboratory
INSERT INTO HospitalLaboratory (HospitalCode, LaboratoryCode)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4);

-- Добавление данных в таблицу DoctorPatient
INSERT INTO DoctorPatient (DoctorCode, RegistrationNumber)
VALUES (1, 1001),
       (2, 1002),
       (3, 1003),
       (4, 1004);

-- Добавление данных в таблицу Placement
INSERT INTO Placement (HospitalCode, ChamberNumber, BedNumber, RegistrationNumber)
VALUES (1, 101, 1, 1001),
       (1, 101, 2, 1002),
       (1, 101, 3, 1003),
       (1, 101, 4, 1004);

-- Добавление данных в таблицу HospitalPhone
INSERT INTO HospitalPhone (HospitalCode, Phone)
VALUES (1, '123-456-7890'),
       (2, '987-654-3210'),
       (3, '555-555-5555'),
       (4, '222-333-4444');

-- Добавление данных в таблицу LaboratoryPhone
INSERT INTO LaboratoryPhone (LaboratoryCode, Phone)
VALUES (1, '123-456-7890'),
       (2, '987-654-3210'),
       (3, '555-555-5555'),
       (4, '222-333-4444');


-- Добавление пациента, у которого анализ выполнился в день рождения
INSERT INTO Patient (RegistrationNumber, LastName, Address, DateOfBirth, gender, PolicyNumber)
VALUES (1005, 'Davis', '123 Birch Street', '1980-09-30', 'мужской', 13579);

-- Добавление анализа для пациента, выполнившегося в день его рождения
INSERT INTO Analysis (RegistrationNumber, LaboratoryCode, AnalysisType, Date, Time, DirectionNumber, Status)
VALUES (1005, 1, 'Анализ крови', '1989-09-30', '09:30', 567, 'Завершен');

DELETE
FROM Patient
WHERE RegistrationNumber = 1005;
DELETE
FROM Analysis
WHERE RegistrationNumber = 1005;