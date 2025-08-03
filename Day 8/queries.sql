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
