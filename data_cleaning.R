# Read, Attach, and Display Variable Names in Dataset
library(dplyr)
readmit <- read.csv("~/Documents/Multivariable\ Analysis/final_project/archive/diabetic_data.csv", header = TRUE)

readmit2 <- readmit %>% 
  mutate(race2 = as.factor(case_when(race != "?" ~ race)),
         gender2 = as.factor(case_when(gender != "Unknown/Invalid" ~ gender)),
         age2 = case_when(age == "[0-10)" ~ 1,
                          age == "[10-20)" ~ 2,
                          age == "[20-30)" ~ 3,
                          age == "[30-40)" ~ 4,
                          age == "[40-50)" ~ 5,
                          age == "[50-60)" ~ 6,
                          age == "[60-70)" ~ 7,
                          age == "[70-80)" ~ 8,
                          age == "[80-90)" ~ 9,
                          age == "[90-100)" ~ 10),
         weight2 = case_when(weight == "[0-25)" ~ 1,
                             weight == "[25-50)" ~ 2,
                             weight == "[50-75)" ~ 3,
                             weight == "[75-100)" ~ 4,
                             weight == "[100-125)" ~ 5,
                             weight == "[125-150)" ~ 6,
                             weight == "[150-175)" ~ 7,
                             weight == "[175-200)" ~ 8,
                             weight == ">200" ~ 9),
         diag_12 = as.numeric(diag_1),
         diag_22 = as.numeric(diag_2),
         diag_32 = as.numeric(diag_3),
         medical_specialty2 = as.factor(case_when(medical_specialty != "?" ~ medical_specialty)),
         max_glu_serum2 = as.factor(case_when(max_glu_serum != "None" ~ max_glu_serum)),
         A1Cresult2 = as.factor(case_when(A1Cresult != "None" ~ A1Cresult)),
         insulin2 = as.factor(insulin),
         change2 = as.factor(change),
         diabetesMed2 = as.factor(diabetesMed),
         readmitted30 = as.factor(case_when(readmitted == "<30" ~ "1",
                                  TRUE ~ "0"))) %>%
  filter(discharge_disposition_id != 11, #Expired
         discharge_disposition_id != 19, #Expired at home
         discharge_disposition_id != 20, #Expired in a medical facility
         discharge_disposition_id != 21, #Expired, place unknown
         discharge_disposition_id != 5, #Transferred to inpatient care institution
         discharge_disposition_id != 9, #Admitted as an inpatient
         discharge_disposition_id != 12,  #Still patient
         discharge_disposition_id != 18,  #NULL
         discharge_disposition_id != 25,  #Not mapped
         discharge_disposition_id != 26,  #Unknown/Invalid
         admission_type_id != 5, #Not available
         admission_type_id != 6, #NULL
         admission_type_id != 8,  #Not mapped
         #admission_type_id != 4,  #Newborn
         admission_source_id != 9, #Not available
         admission_source_id != 15, #Not available
         admission_source_id != 17, #NULL
         admission_source_id != 20, #Not mapped
         admission_source_id != 21,  #Unknown/Invalid
         (diag_12 >= 250 & diag_12 < 251) | (diag_22 >= 250 & diag_22 < 251) | (diag_32 >= 250 & diag_32 < 251))
  select(race2, gender2, age2, weight2, admission_type_id,
         discharge_disposition_id, admission_source_id, time_in_hospital,
         medical_specialty2, num_lab_procedures, num_procedures,
         num_medications, number_outpatient, number_outpatient, number_emergency,
         number_inpatient, number_diagnoses, max_glu_serum2,
         A1Cresult2, insulin2, change2, diabetesMed2, readmitted30,
         diag_12, diag_22, diag_32)

write.csv(readmit2, "~/Documents/Multivariable\ Analysis/final_project/archive/readmit2.csv")
