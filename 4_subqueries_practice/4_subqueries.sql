-- total number of in complete assignment submissions for a student
-- SELECT (
--   SELECT count(assignments)
--   FROM assignments
-- )-count(assignment_submissions) as total_incomplete
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- WHERE students.name = 'Ibrahim Schimmel';

-- COLUMN IN SELECT>>>>
-- SELECT (
--   SELECT count(*)
--   FROM table_name
-- ) as total, other_column
-- FROM other_table_name
-- ORDER BY total;

-- FROM SUB SELECT TABLE>>>>
-- SELECT * FROM (
--   SELECT something_id
--   FROM someTable
--   WHERE something
-- ) as sub_table;

-- calculate the average number of students that attend a cohort
SELECT avg(total_students) as average_students
FROM (
  SELECT count(students) as total_students
  FROM students
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts
) as totals_table;

-- return the name of all assignments not completed by 'Ibrahim Schimmel'
SELECT assignments.name
FROM assignments 
WHERE id NOT IN
(
  SELECT assignment_id
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.name = 'Ibrahim Schimmel'
);