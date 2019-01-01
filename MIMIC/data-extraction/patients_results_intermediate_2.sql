SELECT DISTINCT PRI1.*, 
                  apsiii.apsiii,
                  elix.congestive_heart_failure, 
                  elix.hypertension, 
                  elix.chronic_pulmonary, 
                  elix.diabetes_uncomplicated, 
                  elix.diabetes_complicated, 
                  elix.renal_failure, 
                  elix.liver_disease, 
                  elix.lymphoma, 
                  elix.solid_tumor, 
                  elix.metastatic_cancer,
                  angus.angus
FROM `oxygenators-209612.mimiciii_clinical.patients_Results_Intermediate_1` PRI1
INNER JOIN `oxygenators-209612.mimiciii_clinical.elixhauser_quan` AS elix
  ON elix.HADM_ID = PRI1.HADM_ID
INNER JOIN `oxygenators-209612.mimiciii_clinical.angus_sepsis` AS angus
  ON angus.hadm_id = PRI1.hadm_id
INNER JOIN `oxygenators-209612.mimiciii_clinical.apsiii` AS apsiii
  ON apsiii.hadm_id = PRI1.hadm_id
  AND apsiii.subject_id = PRI1.patient_id
  AND apsiii.icustay_id = PRI1.icustay_id
