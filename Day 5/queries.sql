--Q1. Show first name, last name, and gender of patients whose gender is 'M'
SELECT first_name, last_name, gender
FROM patients
WHERe gender = 'M';

--Q2 Show first name and last name of patients who does not have allergies. (null)
SELECT first_name, last_name
FROM patients
WHERE allergies IS NULL;

--Q3 Show first name of patients that start with the letter 'C'
SELECT first_name
FROM patients
WHERE first_name LIKE 'C%';

--Q4 Show first name and last name of patients whose weight is between 100 and 120
SELECT first_name, last_name
from patients
WHERE weight between 100 AND 120;

--Q5 Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
UPDATE patients
SET allergies = 'NKA'
WHERE allergies IS NULL;

--Q6 Show first name and last name concatinated into one column to show their full name.
SELECT CONCAT(first_name,' ', last_name)
FROM patients;

--Q7 Show first name, last name, and the full province name of each patient.
--Example: 'Ontario' instead of 'ON'
SELECT a.first_name, a.last_name, b.province_name
FROM patients AS a
JOIN province_names AS b
ON a.province_id = b.province_id;

--Q8 Show how many patients have a birth_date with 2010 as the birth year.
SELECT count(*) AS total_patients
FROM patients
WHERE YEAR(birth_date) = 2010;

--Q9 Show the first_name, last_name, and height of the patient with the greatest height.
SELECT count(*) AS total_patients
FROM patients
WHERE YEAR(birth_date) = 2010;

--Q10 Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
select * FROM patients
WHERE patient_id IN(1, 45, 534, 879, 1000);
