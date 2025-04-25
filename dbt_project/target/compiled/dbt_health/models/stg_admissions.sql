SELECT
  subject_id,
  hadm_id,
  admittime,
  dischtime,
  DATE_PART('day', dischtime - admittime) AS los,
  admission_type,
  insurance
FROM public.admissions