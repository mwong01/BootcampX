-- Assistance Requests Data
SELECT
  teachers.name AS teachers,
  students.name AS students,
  assignments.name AS assignments,
  (
    assistance_requests.completed_at - assistance_requests.started_at
  ) AS duration
FROM
  assistance_requests
  JOIN teachers ON teachers.id = teacher_id
  JOIN students ON students.id = student_id
  JOIN assignments ON assignment_id = assignments.id
ORDER BY
  duration;