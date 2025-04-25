SELECT
  subject_id,
  gender,
  dob,
  EXTRACT(YEAR FROM AGE(dob)) AS age
FROM public.patients
