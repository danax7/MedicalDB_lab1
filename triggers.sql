-- Значение атрибута Ч/К больницы равно сумме значений атрибутов Ч/К всех ее палат.
CREATE OR REPLACE FUNCTION CalculateHospitalBedCount()
    RETURNS TRIGGER AS
$$
BEGIN
    IF TG_OP = 'DELETE' THEN
        UPDATE Hospital
        SET BedCount = (SELECT SUM(BedCount) FROM Chamber WHERE HospitalCode = OLD.HospitalCode)
        WHERE HospitalCode = OLD.HospitalCode;
    ELSE
        UPDATE Hospital
        SET BedCount = (SELECT SUM(BedCount) FROM Chamber WHERE HospitalCode = NEW.HospitalCode)
        WHERE HospitalCode = NEW.HospitalCode;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER UpdateHospitalBedCount
    AFTER INSERT OR UPDATE OR DELETE
    ON Chamber
    FOR EACH ROW
EXECUTE FUNCTION CalculateHospitalBedCount();


-- Значение атрибута Н/К не должно превышать значения атрибута Ч/К соответствующей палаты.
CREATE OR REPLACE FUNCTION CheckNKBeds()
    RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.BedNumber >
       (SELECT BedCount FROM Chamber WHERE HospitalCode = NEW.HospitalCode AND ChamberNumber = NEW.ChamberNumber) THEN
        RAISE EXCEPTION 'Номер койки (%) больше, чем количество койк в палате', NEW.BedNumber;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER EnforceNKBeds
    BEFORE INSERT
    ON Placement
    FOR EACH ROW
EXECUTE FUNCTION CheckNKBeds();
