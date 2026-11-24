DROP TABLE IF EXISTS visits_raw;

CREATE TABLE visits_raw (
    patient_id INT NOT NULL,
    patient_name VARCHAR(100) NOT NULL,
    doctor_id INT NOT NULL,
    doctor_name VARCHAR(100) NOT NULL,
    visit_date DATE NOT NULL
);

INSERT INTO visits_raw (patient_id, patient_name, doctor_id, doctor_name, visit_date) VALUES
(1, 'John Doe',      101, 'Dr. Smith',   '2026-11-15'),
(1, 'John Doe',      101, 'Dr. Smith',   '2026-11-15'),
(1, 'John Doe',      102, 'Dr. Johnson', '2026-11-15'),
(1, 'John Doe',      101, 'Dr. Smith',   '2026-11-22'),
(2, 'Bob White',     103, 'Dr. Lee',     '2026-11-18'),
(3, 'Charlie Black', 102, 'Dr. Johnson', '2026-11-19'),
(3, 'Charlie Black', 102, 'Dr. Johnson', '2026-11-26'),
(4, 'Diana Green',   104, 'Dr. Adams',   '2026-11-20'),
(5, 'Ethan Blue',    101, 'Dr. Smith',   '2026-11-21'),
(6, 'Fiona Red',     103, 'Dr. Lee',     '2026-11-22'),
(7, 'George Yellow', 104, 'Dr. Adams',   '2026-11-23'),
(8, 'Hannah Purple', 102, 'Dr. Johnson', '2026-11-24');

SELECT * FROM visits_raw;
SELECT 
    patient_id, 
    patient_name, 
    COUNT(*) AS visits, 
    COUNT(DISTINCT patient_id, doctor_id, visit_date) AS unique_visits
FROM visits_raw
GROUP BY patient_id, patient_name
ORDER BY patient_id;

DROP TABLE IF EXISTS visits;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS doctors;

CREATE TABLE patients(
    patient_id INT AUTO_INCREMENT PRIMARY KEY, 
    patient_name VARCHAR(100) NOT NULL
);

CREATE TABLE doctors(
    doctor_id INT AUTO_INCREMENT PRIMARY KEY, 
    doctor_name VARCHAR(100) NOT NULL
);

CREATE TABLE visits(
    patient_id INT NOT NULL, 
    doctor_id INT NOT NULL, 
    visit_date DATE NOT NULL,
    PRIMARY KEY (patient_id, doctor_id, visit_date),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

INSERT INTO patients(patient_id, patient_name)
SELECT DISTINCT patient_id, patient_name FROM visits_raw;

INSERT INTO doctors(doctor_id, doctor_name)
SELECT DISTINCT doctor_id, doctor_name FROM visits_raw;

INSERT INTO visits(patient_id, doctor_id, visit_date)
SELECT DISTINCT patient_id, doctor_id, visit_date FROM visits_raw;

SELECT (SELECT COUNT(*) FROM visits_raw) AS total_visits,
       (SELECT COUNT(*) FROM visits) AS unique_visits;

SELECT v.visit_date, p.patient_name, d.doctor_name
FROM visits v
JOIN patients p ON v.patient_id = p.patient_id
JOIN doctors d ON v.doctor_id = d.doctor_id
ORDER BY v.visit_date;