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
