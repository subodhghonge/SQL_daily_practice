--Q1 display the first name, last name and number of duplicate patients based on their first name and last name.
--Ex: A patient with an identical name can be considered a duplicate.
SELECT first_name, last_name, COUNT(*)
FROM patients
GROUP BY first_name, last_name
HAVING count(*) > 1;

--Q2 Display patient's full name, height in the units feet rounded to 1 decimal, weight in the unit pounds rounded to 0 decimals, birth_date, gender non abbreviated.
--Convert CM to feet by dividing by 30.48.
--Convert KG to pounds by multiplying by 2.205.
SELECT 
	concat(first_name, ' ', last_name) AS patient_name, ROUND(height/30.48,1), round(weight*2.205,0), birth_date,
    CASE
    	WHEN gender = 'M' THEN 'MALE'
        WHEN gender = 'F' THEN 'FEMALE'
        ELSE 'OTHER'
    END AS gender_type
FROM patients;

--Q3 Display a single row with max_visits, min_visits, average_visits where the maximum, minimum and average number of admissions per day is calculated. Average is rounded to 2 decimal places.
SELECT 
	MAX(admission_date) AS max_visit,
    MIN(admission_date) AS min_visit,
    ROunD(AVG(admission_date), 2) AS average_visit
FROM (
  SELECT admission_date, COUNT(*) AS daily_visit
  FROM admissions
  group by admission_date
 )AS daily_counts;

 