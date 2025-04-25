
  create view "emr_project"."public"."stg_patients__dbt_tmp"
    
    
  as (
    SELECT
  subject_id,
  gender,
  dob,
  EXTRACT(YEAR FROM AGE(dob)) AS age
FROM public.patients
  );