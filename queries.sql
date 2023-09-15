-- Вывод всех данных из таблицы Hospital
SELECT * FROM Hospital;

--Получить фамилии пациентов, у которых анализ выполнялся в день рождения. Именно в день рождения, а не полностью дату
SELECT LastName
FROM Patient
WHERE RegistrationNumber = (
    SELECT RegistrationNumber
    FROM Analysis
    WHERE EXTRACT(MONTH FROM DateOfBirth) = EXTRACT(MONTH FROM Date) AND EXTRACT(DAY FROM DateOfBirth) = EXTRACT(DAY FROM Date)
);

--Средний возраст пациентов в каждой больнице:
SELECT h.Name AS "Больница", AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE,p.dateofbirth ))) AS "Средний возраст"
FROM Hospital h
JOIN Placement pl ON h.HospitalCode = pl.HospitalCode
JOIN Patient p ON pl.RegistrationNumber = p.RegistrationNumber
GROUP BY h.Name;

--Вывести фамилии пациентов, которые лежат в палате с номером 101.
SELECT LastName FROM Patient
WHERE RegistrationNumber IN (
    SELECT RegistrationNumber FROM Placement
    WHERE HospitalCode = 1 AND ChamberNumber = 101
);