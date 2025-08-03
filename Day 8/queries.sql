--Q1) Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria:
-- 1. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.
-- 2. attending_doctor_id contains a 2 and the length of patient_id is 3 characters.

SELECT  patient_id, attending_doctor_id, diagnosis 
FROM admissions
where
  (
    patient_id % 2 != 0
    AND
    attending_doctor_id IN(1, 5, 19)
  )
  or
  (
    attending_doctor_id LIKE '%2%'
    AND
    LEN(patient_id) = 3
  );

--Q2 Show first_name, last_name, and the total number of admissions attended for each doctor. Every admission has been attended by a doctor.
SELECT a.first_name, a.last_name, COUNT(b.attending_doctor_id) AS admissions_total
FROM doctors AS a
JOIN admissions AS b 
ON a.doctor_id = b.attending_doctor_id
group by a.doctor_id;

--Q3 For each doctor, display their id, full name, and the first and last admission date they attended.
select b.doctor_id, CONCAT(b.first_name, ' ', b.last_name), MIN(a.admission_date) AS first_admission_date, mAX(a.admission_date) AS last_admission_date
FROM admissions AS a 
JOIN doctors AS b 
ON a.attending_doctor_id = b.doctor_id
GROUP BY b.doctor_id;

--Q4 Display the total amount of patients for each province. Order by descending.
SELECT b.province_name, COUNT(a.patient_id) AS patient_count
FROM patients AS a 
JOIN province_names AS b 
ON a.province_id = b.province_id
GROUP BY b.province_name
ORDER BY patient_count DESC;

--Q5 For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.
select 
	concat(a.first_name, ' ',a.last_name),
    b.diagnosis,
    CONCAT(c.first_name, ' ',c.last_name)
FROM 
	patients AS a 
JOIN
	admissions AS b 
    ON a.patient_id = b.patient_id
JOIN
	doctors AS c 
    ON b.attending_doctor_id = c.doctor_id;