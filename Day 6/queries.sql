--Q1 Show the total number of admissions
select COUNT(*) AS total_admission
from admissions;

--Q2 Show all the columns from admissions where the patient was admitted and discharged on the same day.
SELECT * FROM admissions
WHERE admission_date = discharge_date;

--Q3 Show the patient id and the total number of admissions for patient_id 579.
SELECT patient_id, COUNT(*) AS total_admission
FROM admissions
WHERE patient_id = 579;

--Q4 Based on the cities that our patients live in, show unique cities that are in province_id 'NS'.
SELECT city FROM patients
WHERE province_id = 'NS'
group by city;

--Q5 Write a query to find the first_name, last name and birth date of patients who has height greater than 160 and weight greater than 70
SELECT first_name, last_name, birth_date
FROM patients
WHERE height > 160 AND weight > 70;

--Q6 Write a query to find list of patients first_name, last_name, and allergies where allergies are not null and are from the city of 'Hamilton'
SELECT first_name, last_name, allergies
FROM patients
WHERE allergies IS NOT NULL AND city = 'Hamilton'; 
