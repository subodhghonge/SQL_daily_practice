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

--DIFFICULTY = MEDIUM
--Q7 Show unique birth years from patients and order them by ascending.
SELECT DISTINCT YEAR(birth_date) AS Birth_years
FROM patients
ORDER BY Birth_years ASC;

--Q8 Show unique first names from the patients table which only occurs once in the list.
-- For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.
SELECT first_name
FROM patients
GROUP BY first_name
HAVING count(*) = 1;

--Q9 Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
SELECT patient_id, first_name
FROM patients
WHERE first_name LIKE 's%s' and LEN(first_name) >= 6;

--Q10 Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'. Primary diagnosis is stored in the admissions table.
SELECT a.patient_id, a.first_name, a.last_name
FROM patients as a
left JOIN admissions AS b
ON a.patient_id = b.patient_id
WHERE b.diagnosis = 'Dementia';

--Q11 Display every patient's first_name. Order the list by the length of each name and then by alphabetically.
SELECT first_name
FROM patients
ORDER BY LEN(first_name), first_name ASC;

--Q12 Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.
SELECT 
	COUNT(CASE WHEN gender = "M" THEN 1 END) AS male_patients,
    COUNT(CASE WHEN gender = "F" THEN 1 END) AS female_patients
FROM patients;

--Q13 Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
SELECT first_name, last_name, allergies
FROM patients
WHERE allergies = 'Penicillin' OR allergies = 'Morphine'
ORDER BY allergies, first_name, last_name;

--Q14 Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
SELECT 
    patient_id, 
    diagnosis
FROM 
    admissions
GROUP BY 
    patient_id, 
    diagnosis
HAVING 
    COUNT(*) > 1;