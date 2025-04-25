WITH visit_counts AS (
  SELECT
    subject_id,
    COUNT(*) AS total_visits
  FROM public.admissions
  GROUP BY subject_id
)

SELECT
  p.subject_id,
  p.gender,
  EXTRACT(YEAR FROM AGE(p.dob)) AS age,
  v.total_visits,
  CASE WHEN v.total_visits > 1 THEN TRUE ELSE FALSE END AS readmitted_flag
FROM public.patients p
JOIN visit_counts v ON p.subject_id = v.subject_id