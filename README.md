# HIA217_FinalProject

These scripts were used in my final project for HIA 217: Multivariable Analysis and Data Visualization. The project's aim was to predict diabetic patients' 30 day 
hospital readmission by performing a logistic regression.

Dataset: Hospital admission data from 130 U.S. hospitals between the years 1999-2008. Data from 101,766 patients. Sourced from Kaggle.com. 
https://www.kaggle.com/saurabhtayal/diabetic-patients-readmission-prediction?select=diabetic_data.csv

Variables available in the dataset include: 
Patient demographics (e.g., age, gender, race)
Admission and discharge details (e.g., department admitted to, location discharged to)
Treatment details (e.g., days in hospital, number of lab tests, ICD-9 diagnosis codes)
Change in medications (insulin, metformin, etc)
Patient visit history (e.g., number of  inpatient and outpatient visits in   year  preceding encounter)
Dependent variable: whether or not the patient was readmitted within 30 days

Performance:
AUC = 0.69

Predictors:
Discharge location
Change in Metformin dosage
Change in Insulin dosage
Number of medications administered
Number of diagnoses input
Number of inpatient visits in year leading up to encounter

Protective factors for 30 day hospital readmission:
32-40% decrease in readmission if Metformin was maintained or increased
11-15% decrease in readmission if Insulin was maintained or increased
59% decrease if discharged to a long term care hospital
31-77% decrease if discharged to hospice care

Risk factors for 30 day hospital readmission:
33% increase for every inpatient visit within year prior to encounter
6% increase per diagnosis input during encounter
5x greater likelihood if discharged to a rehabilitation facility
12x greater likelihood if discharged to a psychiatric hospital (although not a strong conclusion due to the small N)

Interpretations:



