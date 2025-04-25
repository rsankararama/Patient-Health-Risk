
-- Drop all existing tables with cascade to remove dependencies
DROP TABLE IF EXISTS diagnoses_icd CASCADE;
DROP TABLE IF EXISTS admissions CASCADE;
DROP TABLE IF EXISTS patients CASCADE;

-- Recreate the patients table (8 columns)
CREATE TABLE patients (
    row_id INT,
    subject_id INT PRIMARY KEY,
    gender VARCHAR(10),
    dob TIMESTAMP,
    dod TIMESTAMP,
    dod_hosp TIMESTAMP,
    dod_ssn TIMESTAMP,
    expire_flag INT
);

-- Recreate the admissions table (17 columns to match CSV exactly)
DROP TABLE IF EXISTS admissions CASCADE;

CREATE TABLE admissions (
    row_id INT,
    subject_id INT REFERENCES patients(subject_id),
    hadm_id INT,
    admittime TIMESTAMP,
    dischtime TIMESTAMP,
    deathtime TIMESTAMP,
    admission_type VARCHAR(50),
    admission_location VARCHAR(100),
    discharge_location VARCHAR(100),
    insurance VARCHAR(50),
    language VARCHAR(50),
    religion VARCHAR(50),
    marital_status VARCHAR(50),
    ethnicity VARCHAR(100),
    edregtime TIMESTAMP,
    edouttime TIMESTAMP,
    diagnosis TEXT,
    hospital_expire_flag INT,
    has_chartevents_data INT
);


-- Recreate the diagnoses_icd table (5 columns, icd_version as VARCHAR)
CREATE TABLE diagnoses_icd (
    row_id INT,
    subject_id INT REFERENCES patients(subject_id),
    hadm_id INT,
    icd_code VARCHAR(10),
    icd_version VARCHAR(10)
);
