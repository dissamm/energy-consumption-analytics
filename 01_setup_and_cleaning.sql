CREATE DATABASE energy_project;
USE energy_project;
CREATE TABLE energy (
    date_text               VARCHAR(20),
    usage_kwh               DECIMAL(10,2),
    lagging_reactive_kvarh  DECIMAL(10,2),
    leading_reactive_kvarh  DECIMAL(10,2),
    co2_tco2                DECIMAL(10,2),
    lagging_pf              DECIMAL(10,2),
    leading_pf              DECIMAL(10,2),
    nsm                     INT,
    week_status             VARCHAR(20),
    day_of_week             VARCHAR(20),
    load_type               VARCHAR(20)
);
SELECT COUNT(*) FROM energy;
SELECT date_text,
       STR_TO_DATE(date_text, '%d/%m/%Y %H:%i') AS converted
FROM energy
LIMIT 5;
ALTER TABLE energy ADD COLUMN ts DATETIME;

SET SQL_SAFE_UPDATES = 0;

UPDATE energy
SET ts = STR_TO_DATE(date_text, '%d/%m/%Y %H:%i');
SELECT COUNT(*) FROM energy WHERE ts IS NULL;
SELECT MIN(ts), MAX(ts) FROM energy;