-- # students in cohort 1
SELECT id, name 
FROM students 
WHERE cohort_id = 1
ORDER BY name;

-- count # students in first 3 cohorts
SELECT count(id)
FROM students 
WHERE cohort_id IN (1,2,3);

-- students who do not have email or phone
SELECT name, id, cohort_id
FROM students
WHERE email IS NULL
OR phone IS NULL;

-- students who do not have gmail or phone
SELECT name, email, id, cohort_id
FROM students
WHERE email NOT LIKE '%gmail.com'
AND phone IS NULL;

-- -- current students 
-- SELECT name, id, cohort_id
-- FROM students
-- WHERE end_date IS NULL
-- ORDER BY cohort_id;

-- graduates without a linked Github account
SELECT name, email, phone
FROM students
WHERE github IS NULL
AND end_date IS NOT NULL;

-- query to get rollover students
SELECT students.name, cohorts.name, cohorts.start_date as cohort_start_date, students.start_date as student_start_date
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.start_date != students.start_date;