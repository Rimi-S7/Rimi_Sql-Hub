-- 1.Creating duplicate table to restore original table data --
CREATE TABLE dataset
SELECT *
FROM healthcare_dataset;

-- 2. Count total number of patient records
SELECT COUNT(patient_name) AS total_patients 
FROM dataset;

-- 3. List distinct medical conditions
SELECT medical_condition
FROM dataset
GROUP BY medical_condition;

-- 4. Get total billing amount across all patients
SELECT ROUND(SUM(billing_amount),2) AS total_billing 
FROM dataset;

-- 5. Find average age of patients
SELECT ROUND(AVG(age)) AS avg_patient_age 
FROM dataset;

-- 6. Total billing per medical condition
SELECT medical_condition, ROUND(SUM(billing_amount),2) AS total_billing
FROM dataset
GROUP BY medical_condition
ORDER BY total_billing DESC;

-- 7. Count patients per admission type
SELECT admission_type, COUNT(*) AS num_patients
FROM dataset
GROUP BY admission_type;

-- 8. Average billing by insurance provider
SELECT insurance_provider, ROUND(AVG(billing_amount),2) AS avg_billing
FROM dataset
GROUP BY insurance_provider
ORDER BY avg_billing DESC;

-- 9. Patients treated by a specific doctor
SELECT * 
FROM dataset
WHERE doctor = 'Matthew Smith';

-- 10. Number of patients with 'Abnormal' test results
SELECT COUNT(test_results) AS abnormal_results
FROM dataset
WHERE test_results = 'Abnormal';

-- 11. Most common medication prescribed
SELECT medication, COUNT(*) AS prescriptions
FROM dataset
GROUP BY medication
ORDER BY prescriptions DESC;

-- 12. Average billing for patients with 'Asthma'
SELECT ROUND(AVG(billing_amount),2) AS avg_asthma_billing
FROM dataset
WHERE medical_condition = 'Asthma';

-- 13. Age distribution by medical condition
SELECT medical_condition, ROUND(AVG(Age)) AS avg_age
FROM dataset
GROUP BY medical_condition;

-- 14. Identify high-billing patients (above $40,000)
SELECT patient_name, ROUND(billing_amount,2)
FROM dataset
WHERE billing_amount > 40000;

-- 15. Patients admitted for 'Emergency' with 'Cancer'
SELECT * 
FROM dataset
WHERE medical_condition = 'Cancer'
AND admission_type = 'Emergency';

-- 16. Overview
SELECT COUNT(*) AS total_patients, ROUND(AVG(age)) AS avg_age,
ROUND(SUM(billing_amount),2) AS total_billing
FROM dataset;


