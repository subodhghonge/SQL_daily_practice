--Q1 Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
select city, COUNT(*) AS total_patients
FROM patients
group by city
ORDER BY total_patients DESC, city ASC;

--Q2 Show first name, last name and role of every person that is either patient or doctor. The roles are either "Patient" or "Doctor"
select first_name, last_name, 'Patient' AS role
from patients

UNION ALL

select first_name, last_name, 'Doctor' AS role 
FROM doctors;

--Q3 Show all allergies ordered by popularity. Remove NULL values from query.
SELECT allergies, COUNT(*) AS total_diagnosis
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY total_diagnosis DESC;

--Q4 Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
SELECT first_name, last_name, birth_date
FROM patients
WHERE birth_date BETWEEN '1970-01-01' AND '1979-12-31'
ORDER BY birth_date ASC;


--Q5 We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. 
--Separate the last_name and first_name with a comma. Order the list by the first_name in decending order EX: SMITH,jane
select concat(UPPER(last_name),',',LOWER(first_name)) AS new_name_format
FROM patients
order by first_name desc;

--Q6 Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
SELECT province_id, SUM(height)
FROM patients
group by province_id
HAVING SUM(height) >= 7000;

--Q7 Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
SELECT (MAX(weight)-MIN(weight)) 
FROM patients
WHERE last_name = 'Maroni'
ORDER BY weight DESC;

--Q8 Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
SELECT day(admission_date) AS day_number, COUNT(*) AS number_of_admissions
FROM admissions
group by day_number
order by number_of_admissions desc;

--Q9 