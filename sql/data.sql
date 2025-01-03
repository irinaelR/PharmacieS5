-- med_category Table data
INSERT INTO med_category (name) VALUES
('Analgesics'), -- Pain relievers
('Antibiotics'), -- Medications that fight bacterial infections
('Antidepressants'), -- Medications for treating depression
('Antifungals'), -- Medications that fight fungal infections
('Antihistamines'), -- Medications used to treat allergies
('Antihypertensives'), -- Medications used to lower blood pressure
('Antivirals'), -- Medications that fight viral infections
('Beta Blockers'), -- Medications used to treat high blood pressure, angina, etc.
('Calcium Channel Blockers'), -- Medications used to treat high blood pressure, angina, etc.
('Corticosteroids'), -- Anti-inflammatory and immunosuppressant medications
('Diuretics'), -- Medications that increase urine output
('NSAIDs (Nonsteroidal Anti-inflammatory Drugs)'), -- Pain relievers and anti-inflammatory drugs
('Proton Pump Inhibitors (PPIs)'), -- Medications that reduce stomach acid production
('Statins'), -- Medications used to lower cholesterol
('Antidiabetics'), -- Medications used to treat diabetes
('Antiplatelets'), -- Medications that prevent blood clotting
('Hormone Replacement'), -- Medications used to replace hormones
('Respiratory Medications'), -- Medications used to treat respiratory conditions
('Anticonvulsants'), -- Medications used to treat seizures
('Anti-Allergics'), -- Medications used to treat allergies
('Antiemetics'), -- For nausea and vomiting
('Laxatives'), -- For constipation
('Antacids'), -- For heartburn and indigestion
('Muscle Relaxants'), -- Medications used to relax muscles
('Antipsychotics'), -- Medications used to treat psychotic disorders
('Antianxiety Medications'), -- Medications used to treat anxiety
('Immunosuppressants'), -- Medications that suppress the immune system
('Anticoagulants'), -- Medications that prevent blood clotting (blood thinners)
('Bronchodilators'), -- Medications that open up the airways in the lungs
('Selective Serotonin Reuptake Inhibitors (SSRIs)'), -- Subcategory of Antidepressants
('Benzodiazepines'), -- Subcategory of Antianxiety Medications
('Loop Diuretics'), -- Subcategory of Diuretics
('Thiazide Diuretics'), -- Subcategory of Diuretics
('Biguanides'), -- Subcategory of Antidiabetics (Metformin's class)
('Insulins'), -- Subcategory of Antidiabetics
('Inhaled Corticosteroids'), -- Subcategory of Corticosteroids
('Leukotriene Receptor Antagonists'), -- More specific for Montelukast
('ACE Inhibitors'), -- Subcategory of Antihypertensives (Lisinopril's class)
('Angiotensin II Receptor Blockers (ARBs)'), -- Subcategory of Antihypertensives (Losartan's class)
('Beta-2 Agonists'); -- Subcategory of Bronchodilators (Salbutamol's class)

-- tlab_types Table data
INSERT INTO lab_types (name) VALUES
('Pharmaceutical Company'),
('Generic Drug Manufacturer'),
('Biotechnology Company'),
('Research Laboratory'),
('Compounding Pharmacy');

-- laboratories Table data
INSERT INTO laboratories (name, type_id) VALUES
('Pfizer', 1), -- Pharmaceutical Company
('Teva Pharmaceuticals', 2), -- Generic Drug Manufacturer
('Novartis', 1), -- Pharmaceutical Company
('Mylan', 2), -- Generic Drug Manufacturer (now Viatris)
('Sanofi', 1), -- Pharmaceutical Company
('AstraZeneca', 1), -- Pharmaceutical Company
('Johnson & Johnson', 1), -- Pharmaceutical Company
('Actavis', 2), -- Generic Drug Manufacturer (now part of Teva)
('Sun Pharmaceutical', 2), -- Generic Drug Manufacturer
('Roche', 3), -- Biotechnology Company
('Hikma Pharmaceuticals', 2), -- Generic Drug Manufacturer
('Bristol Myers Squibb', 1), -- Pharmaceutical Company
('Abbott Laboratories', 1), -- Pharmaceutical Company
('Cipla', 2), -- Generic Drug Manufacturer
('Lupin Limited', 2), -- Generic Drug Manufacturer
('Galenika', 1), -- Serbian company, presence in Africa
('Aspen Pharmacare', 1), -- South African company, strong African presence
('Adcock Ingram', 1), -- South African company
('Strides Pharma Science', 2), -- Indian company, focus on emerging markets
('Hetero Labs', 2), -- Indian company, major generic manufacturer
('Emcure Pharmaceuticals', 2), -- Indian company
('IPCA Laboratories', 2), -- Indian company
('Unique Pharmaceutical Laboratories', 2), -- Indian company
('Medreich Sterilab Limited', 2), -- Indian company
('Laboratoires Biopharma Madagascar', 5); -- Local Madagascan lab (Compounding/Distribution)

-- medicines Table data
INSERT INTO medicines (name, needs_notice, category_id, lab_id) VALUES
('Aspirin', false, 1, 19), -- Analgesic (Likely generic from India - Strides Pharma)
('Ibuprofen', true, 12, 20), -- NSAID (Likely generic from India - Hetero Labs)
('Paracetamol', false, 1, 21), -- Analgesic (Likely generic from India - Emcure)
('Amoxicillin', false, 2, 22), -- Antibiotic (Likely generic from India - IPCA)
('Ciprofloxacin', false, 2, 23), -- Antibiotic (Likely generic from India - Unique Pharma)
('Doxycycline', false, 2, 24), -- Antibiotic (Likely generic from India - Medreich)
('Azithromycin', true, 2, 19), -- Antibiotic (Likely generic from India - Strides Pharma)
('Metformin', false, 15, 20), -- Antidiabetic (Likely generic from India - Hetero Labs)
('Atorvastatin', true, 14, 17), -- Statin (Aspen Pharmacare - strong African presence)
('Omeprazole', false, 13, 19), -- PPI (Likely generic from India - Strides Pharma)
('Simvastatin', false, 14, 20), -- Statin (Likely generic from India - Hetero Labs)
('Losartan', false, 6, 21), -- Antihypertensive (Likely generic from India - Emcure)
('Hydrochlorothiazide', true, 11, 22), -- Diuretic (Likely generic from India - IPCA)
('Amlodipine', false, 9, 23), -- Calcium Channel Blocker (Likely generic from India - Unique Pharma)
('Gabapentin', true, 19, 24), -- Anticonvulsant (Likely generic from India - Medreich)
('Lisinopril', true, 6, 19), -- Antihypertensive (Likely generic from India - Strides Pharma)
('Levothyroxine', true, 17, 20), -- Hormone Replacement (Likely generic from India - Hetero Labs)
('Montelukast', false, 18, 21), -- Respiratory Medication/Anti-Allergic (Likely generic from India - Emcure)
('Clopidogrel', true, 16, 22), -- Antiplatelet (Likely generic from India - IPCA)
('Metoprolol', true, 8, 23), -- Beta Blocker (Likely generic from India - Unique Pharma)
('Ondansetron', true, 21, 24), -- Antiemetic (Likely generic from India - Medreich)
('Loperamide', false, 22, 19), -- Anti-diarrheal, can be considered a type of laxative in reverse (Likely generic from India - Strides Pharma)
('Ranitidine', false, 23, 20), -- Antacid (though less commonly used now due to safety concerns; could be replaced with Famotidine) (Likely generic from India - Hetero Labs)
('Cyclobenzaprine', true, 24, 21), -- Muscle Relaxant (Likely generic from India - Emcure)
('Quetiapine', true, 25, 22), -- Antipsychotic (Likely generic from India - IPCA)
('Alprazolam', true, 26, 23), -- Antianxiety Medication (Likely generic from India - Unique Pharma)
('Prednisone', true, 10, 24), -- Corticosteroid (Likely generic from India - Medreich)
('Warfarin', true, 28, 19), -- Anticoagulant (Likely generic from India - Strides Pharma)
('Salbutamol', true, 29, 17), -- Bronchodilator (Also known as Albuterol) (Aspen Pharmacare or generic from India)
('Cetirizine', false, 5, 20), -- Antihistamine (Likely generic from India - Hetero Labs)
('Furosemide', true, 11, 21), -- Diuretic (Likely generic from India - Emcure)
('Insulin glargine', true, 15, 5), -- Antidiabetic (Sanofi)
('Fluoxetine', true, 30, 22), -- Antidepressant (Likely generic from India - IPCA)
('Ketoconazole', true, 4, 23), -- Antifungal (Likely generic from India - Unique Pharma)
('Valacyclovir', true, 7, 24), -- Antiviral (Likely generic from India - Medreich)
('Sertraline', true, 30, 19), -- SSRI Antidepressant (Likely generic from India - Strides Pharma)
('Lorazepam', true, 31, 20), -- Benzodiazepine (Likely generic from India - Hetero Labs)
('Bumetanide', true, 32, 21), -- Loop Diuretic (Likely generic from India - Emcure)
('Chlorthalidone', true, 33, 22), -- Thiazide Diuretic (Likely generic from India - IPCA)
('Glipizide', true, 15, 23), -- Antidiabetic (Sulfonylurea, another class) (Likely generic from India - Unique Pharma)
('Insulin lispro', true, 35, 1), -- Rapid-acting Insulin (Pfizer)
('Fluticasone', true, 36, 6), -- Inhaled Corticosteroid (AstraZeneca)
('Zafirlukast', true, 37, 24), -- Leukotriene Receptor Antagonist (Likely generic from India - Medreich)
('Enalapril', true, 38, 19), -- ACE Inhibitor (Likely generic from India - Strides Pharma)
('Valsartan', true, 39, 20), -- ARB (Likely generic from India - Hetero Labs)
('Formoterol', true, 40, 3), -- Long-acting Beta-2 Agonist (Novartis)
('Amitriptyline', true, 3, 21), -- Tricyclic Antidepressant (older class, still used) (Likely generic from India - Emcure)
('Nystatin', true, 4, 22), -- Antifungal (often topical) (Likely generic from India - IPCA)
('Acyclovir', true, 7, 23), -- Antiviral (Likely generic from India - Unique Pharma)
('Cetirizine', false, 5, 24); -- Antihistamine (Likely generic from India - Medreich)

-- measuring_nuits Table data
INSERT INTO measuring_units (name) VALUES
('mg'),   -- Milligram
('g'),    -- Gram
('mcg'),  -- Microgram
('mL'),   -- Milliliter
('L'),    -- Liter
('IU'),   -- International Unit
('%'),    -- Percentage (e.g., concentration)
('U'),    -- Unit (e.g., insulin units)
('mmol'), -- Millimole
('mEq'), -- Milliequivalent
('drop'), -- Drop (singular)
('puf'),  -- Puff (shortened)
('cap'),  -- Capsule (shortened)
('tab'),  -- Tablet (shortened)
('sup'),  -- Suppository (shortened)
('vial'); -- Vial

-- med_form Table data
INSERT INTO med_form (name) VALUES
('Tablet'),
('Capsule'),
('Syrup'),
('Suspension'),
('Solution'),
('Injection'),
('Cream'),
('Ointment'),
('Lotion'),
('Gel'),
('Suppository'),
('Pessary'), -- Vaginal suppository
('Inhaler'),
('Nebulizer Solution'),
('Eye Drops'),
('Ear Drops'),
('Nasal Spray'),
('Transdermal Patch'),
('Powder for Reconstitution'),
('Elixir'),
('Emulsion'),
('Aerosol'),
('Paste'),
('Mouthwash'),
('Gargle'),
('Enema'),
('Implant'),
('Lozenge/Troche');

-- medicines_formats Table data
INSERT INTO medicines_formats (med_id, form_id) VALUES
(1, 1),  -- Aspirin - Tablet
(1, 13), -- Aspirin - Inhaler (Used in some specific cases)
(2, 1),  -- Ibuprofen - Tablet
(2, 2),  -- Ibuprofen - Capsule
(2, 4),  -- Ibuprofen - Suspension
(3, 1),  -- Paracetamol - Tablet
(3, 3),  -- Paracetamol - Syrup
(3, 11), -- Paracetamol - Suppository
(4, 2),  -- Amoxicillin - Capsule
(4, 4),  -- Amoxicillin - Suspension
(5, 1),  -- Ciprofloxacin - Tablet
(5, 5),  -- Ciprofloxacin - Solution (for IV use)
(6, 2),  -- Doxycycline - Capsule
(6, 1),  -- Doxycycline - Tablet
(7, 1),  -- Azithromycin - Tablet
(7, 4),  -- Azithromycin - Suspension
(8, 1),  -- Metformin - Tablet
(9, 1),  -- Atorvastatin - Tablet
(10, 2), -- Omeprazole - Capsule
(10, 1), -- Omeprazole - Tablet
(11, 1), -- Simvastatin - Tablet
(12, 1), -- Losartan - Tablet
(13, 1), -- Hydrochlorothiazide - Tablet
(14, 1), -- Amlodipine - Tablet
(15, 2), -- Gabapentin - Capsule
(15, 1), -- Gabapentin - Tablet
(16, 1), -- Lisinopril - Tablet
(17, 1), -- Levothyroxine - Tablet
(18, 1), -- Montelukast - Tablet
(18, 28),-- Montelukast - Chewable Tablet/Troche
(19, 1), -- Clopidogrel - Tablet
(20, 1), -- Metoprolol - Tablet
(20, 6), -- Metoprolol - Injection
(21, 6), -- Ondansetron - Injection
(21, 1), -- Ondansetron - Tablet
(22, 2), -- Loperamide - Capsule
(22, 1), -- Loperamide - Tablet
(23, 1), -- Ranitidine - Tablet
(23, 3), -- Ranitidine - Syrup
(24, 1), -- Cyclobenzaprine - Tablet
(25, 1), -- Quetiapine - Tablet
(26, 1), -- Alprazolam - Tablet
(27, 1), -- Prednisone - Tablet
(28, 1), -- Warfarin - Tablet
(29, 13),-- Salbutamol - Inhaler
(29, 14),-- Salbutamol - Nebulizer Solution
(30, 1), -- Cetirizine - Tablet
(30, 3), -- Cetirizine - Syrup
(31, 1), -- Furosemide - Tablet
(31, 6), -- Furosemide - Injection
(32, 6), -- Insulin glargine - Injection
(33, 1), -- Fluoxetine - Tablet
(33, 3), -- Fluoxetine - Syrup
(34, 7), -- Ketoconazole - Cream
(34, 1), -- Ketoconazole - Tablet
(35, 1), -- Valacyclovir - Tablet
(36, 1), -- Sertraline - Tablet
(37, 1), -- Lorazepam - Tablet
(37, 6), -- Lorazepam - Injection
(38, 1), -- Bumetanide - Tablet
(38, 6), -- Bumetanide - Injection
(39, 1), -- Chlorthalidone - Tablet
(40, 1), -- Glipizide - Tablet
(41, 6), -- Insulin lispro - Injection
(42, 13),-- Fluticasone - Inhaler
(42, 17),-- Fluticasone - Nasal Spray
(43, 1), -- Zafirlukast - Tablet
(44, 1), -- Enalapril - Tablet
(45, 1), -- Valsartan - Tablet
(46, 13),-- Formoterol - Inhaler
(47, 1), -- Amitriptyline - Tablet
(48, 7), -- Nystatin - Cream
(48, 4), -- Nystatin - Suspension
(49, 1), -- Acyclovir - Tablet
(49, 7), -- Acyclovir - Cream
(50, 1), -- Cetirizine - Tablet
(50, 3); -- Cetirizine - Syrup

-- medicines_dosages Table data
INSERT INTO medicines_dosages (med_format_id, price, dose, unit_id) VALUES
(1, 2250, 500, 1),   -- Aspirin - Tablet
(2, 36000, 100, 1),  -- Aspirin - Inhaler
(3, 4500, 200, 1),   -- Ibuprofen - Tablet
(4, 6750, 400, 1),   -- Ibuprofen - Capsule
(5, 18000, 100, 4),  -- Ibuprofen - Suspension
(6, 1350, 500, 1),   -- Paracetamol - Tablet
(7, 11250, 120, 4),  -- Paracetamol - Syrup
(8, 4500, 250, 1),   -- Paracetamol - Suppository
(9, 13500, 500, 1),  -- Amoxicillin - Capsule
(10, 22500, 250, 4), -- Amoxicillin - Suspension
(11, 22500, 500, 1), -- Ciprofloxacin - Tablet
(12, 45000, 200, 4), -- Ciprofloxacin - Solution
(13, 18000, 100, 1), -- Doxycycline - Capsule
(14, 20250, 100, 1), -- Doxycycline - Tablet
(15, 27000, 250, 1), -- Azithromycin - Tablet
(16, 36000, 200, 4), -- Azithromycin - Suspension
(17, 6750, 500, 1),  -- Metformin - Tablet
(18, 36000, 10, 1),  -- Atorvastatin - Tablet
(19, 18000, 20, 1),  -- Omeprazole - Capsule
(20, 22500, 40, 1),  -- Omeprazole - Tablet
(21, 27000, 20, 1),  -- Simvastatin - Tablet
(22, 13500, 50, 1),  -- Losartan - Tablet
(23, 9000, 25, 1),   -- Hydrochlorothiazide - Tablet
(24, 18000, 5, 1),   -- Amlodipine - Tablet
(25, 22500, 300, 1), -- Gabapentin - Capsule
(26, 27000, 100, 1), -- Gabapentin - Tablet
(27, 13500, 10, 1),  -- Lisinopril - Tablet
(28, 36000, 100, 3), -- Levothyroxine - Tablet
(29, 40500, 10, 1),  -- Montelukast - Tablet
(30, 42750, 5, 1),   -- Montelukast - Chewable
(31, 31500, 75, 1),  -- Clopidogrel - Tablet
(32, 18000, 50, 1),  -- Metoprolol - Tablet
(33, 54000, 5, 4),   -- Metoprolol - Injection
(34, 36000, 4, 4),   -- Ondansetron - Injection
(35, 27000, 8, 1),   -- Ondansetron - Tablet
(36, 6750, 2, 1),    -- Loperamide - Capsule
(37, 4500, 2, 1),    -- Loperamide - Tablet
(38, 13500, 150, 1), -- Ranitidine - Tablet
(39, 11250, 75, 4),  -- Ranitidine - Syrup
(40, 22500, 10, 1),  -- Cyclobenzaprine - Tablet
(41, 31500, 25, 1),  -- Quetiapine - Tablet
(42, 18000, 0.5, 1), -- Alprazolam - Tablet
(43, 27000, 5, 1),   -- Prednisone - Tablet
(44, 40500, 5, 1),   -- Warfarin - Tablet
(45, 54000, 100, 3), -- Salbutamol - Inhaler
(46, 67500, 5, 4),   -- Salbutamol - Nebulizer
(47, 13500, 10, 1),  -- Cetirizine - Tablet
(48, 11250, 5, 4),   -- Cetirizine - Syrup
(49, 22500, 40, 1),  -- Furosemide - Tablet
(50, 36000, 10, 4),  -- Furosemide - Injection
(51, 90000, 100, 8), -- Insulin glargine - Injection
(52, 18000, 20, 1),  -- Fluoxetine - Tablet
(53, 15750, 20, 4),  -- Fluoxetine - Syrup
(54, 36000, 20, 7),  -- Ketoconazole - Cream
(55, 45000, 200, 1), -- Ketoconazole - Tablet
(56, 54000, 500, 1), -- Valacyclovir - Tablet
(57, 22500, 50, 1),  -- Sertraline - Tablet
(58, 13500, 1, 1),   -- Lorazepam - Tablet
(59, 67500, 4, 4),   -- Lorazepam - Injection
(60, 18000, 1, 1),   -- Bumetanide - Tablet
(61, 45000, 0.5, 4), -- Bumetanide - Injection
(62, 9000, 25, 1),   -- Chlorthalidone - Tablet
(63, 13500, 5, 1),   -- Glipizide - Tablet
(64, 81000, 100, 8), -- Insulin lispro - Injection
(65, 67500, 50, 3),  -- Fluticasone - Inhaler
(66, 54000, 50, 4),  -- Fluticasone - Nasal Spray
(67, 45000, 10, 1),  -- Zafirlukast - Tablet
(68, 9000, 10, 1),   -- Enalapril - Tablet
(69, 18000, 80, 1),  -- Valsartan - Tablet
(70, 81000, 12, 3),  -- Formoterol - Inhaler
(71, 13500, 25, 1),  -- Amitriptyline - Tablet
(72, 27000, 100000, 6), -- Nystatin - Cream
(73, 22500, 100000, 4), -- Nystatin - Suspension
(74, 36000, 200, 1), -- Acyclovir - Tablet
(75, 31500, 5, 7),   -- Acyclovir - Cream
(76, 13500, 10, 1),  -- Cetirizine - Tablet
(77, 11250, 5, 4);   -- Cetirizine - Syrup

-- medical_constraints Table data
INSERT INTO medical_constraints (name) VALUES
('Pregnancy'),
('Breastfeeding'),
('Liver Disease'),
('Kidney Disease'),
('Asthma'),
('Peptic Ulcer'),
('Heart Failure'),
('High Blood Pressure (Uncontrolled)'),
('Diabetes'),
('Allergy to Aspirin'),
('Allergy to Ibuprofen'),
('Allergy to Penicillin (Amoxicillin)'),
('Allergy to Fluoroquinolones (Ciprofloxacin)'),
('Allergy to Tetracyclines (Doxycycline)'),
('Allergy to Macrolides (Azithromycin)'),
('Active Bleeding'),
('Blood Clotting Disorders'),
('G6PD Deficiency'),
('Epilepsy'),
('Severe Renal Impairment'),
('Severe Hepatic Impairment'),
('Hypersensitivity to the specific medication'),
('Children under 12 years old'),
('Elderly patients (use with caution)');

-- medicines_restrictions Table data
INSERT INTO medicines_restrictions (med_id, constraint_id) VALUES
-- Aspirin
(1, 1),  -- Pregnancy (especially in the third trimester)
(1, 6),  -- Peptic Ulcer
(1, 10), -- Allergy to Aspirin
(1, 16), -- Active Bleeding
(1, 17), -- Blood Clotting Disorders
(1, 23), -- Children under 16 with viral illness (Reye's syndrome risk)
-- Ibuprofen
(2, 1),  -- Pregnancy (especially in the third trimester)
(2, 6),  -- Peptic Ulcer
(2, 11), -- Allergy to Ibuprofen
(2, 7),  -- Heart Failure (can worsen fluid retention)
(2, 4), -- Kidney Disease (can worsen kidney function)
-- Paracetamol (relatively few contraindications in normal doses)
(3, 3), -- Liver Disease (high doses)
(3, 22), -- Hypersensitivity to Paracetamol
-- Amoxicillin
(4, 12), -- Allergy to Penicillin
-- Ciprofloxacin
(5, 13), -- Allergy to Fluoroquinolones
(5, 19), -- Epilepsy
(5, 23), -- Children (risk of tendon damage)
-- Doxycycline
(6, 1),  -- Pregnancy
(6, 23), -- Children under 8 (teeth staining)
(6, 14), -- Allergy to Tetracyclines
-- Azithromycin
(7, 15), -- Allergy to Macrolides
-- Metformin
(8, 4),  -- Kidney Disease
(8, 7),  -- Heart Failure (Severe)
(8, 20), -- Severe Renal Impairment
-- Atorvastatin
(9, 3),  -- Liver Disease
(9, 1), -- Pregnancy
(9, 2), -- Breastfeeding
-- Omeprazole
(10, 22), -- Hypersensitivity to Omeprazole
-- Simvastatin
(11, 3),  -- Liver Disease
(11, 1), -- Pregnancy
(11, 2), -- Breastfeeding
-- Losartan
(12, 1),  -- Pregnancy (especially second and third trimesters)
-- Hydrochlorothiazide
(13, 9),  -- Diabetes (can affect blood sugar control)
(13, 4),  -- Kidney Disease (can worsen kidney function)
-- Amlodipine
(14, 7),  -- Heart Failure (use with caution)
-- Gabapentin
(15, 4), -- Kidney Disease (dosage adjustment needed)
(15, 19), -- Epilepsy (can affect seizure control in some cases)
-- Lisinopril
(16, 1),  -- Pregnancy (especially second and third trimesters)
(16, 4), -- Kidney Disease (can worsen kidney function)
-- Levothyroxine
(17, 7),  -- Heart conditions (use with caution)
-- Montelukast
(18, 22), -- Hypersensitivity to Montelukast
-- Clopidogrel
(19, 16), -- Active Bleeding
(19, 17), -- Blood Clotting Disorders
(19, 22), -- Hypersensitivity to Clopidogrel
-- Metoprolol
(20, 5),  -- Asthma
(20, 7),  -- Heart Failure (certain types)
-- Ondansetron
(21, 22), -- Hypersensitivity to Ondansetron
-- Loperamide
(22, 18), -- G6PD Deficiency
-- Ranitidine (less common now due to interactions)
(23, 22), -- Hypersensitivity to Ranitidine
-- Cyclobenzaprine
(24, 22), -- Hypersensitivity to Cyclobenzaprine
-- Quetiapine
(25, 22), -- Hypersensitivity to Quetiapine
-- Alprazolam
(26, 22), -- Hypersensitivity to Alprazolam
-- Prednisone
(27, 9), -- Diabetes
(27, 8), -- High Blood Pressure (Uncontrolled)
(27, 6), -- Peptic Ulcer
-- Warfarin
(28, 16), -- Active Bleeding
(28, 17), -- Blood Clotting Disorders
-- Salbutamol
(29, 7), -- Heart Conditions (use with caution)
-- Cetirizine
(30, 22), -- Hypersensitivity to Cetirizine
-- Furosemide
(31, 4), -- Kidney Disease
-- Insulin glargine/lispro
(32, 9), -- Diabetes (Requires careful monitoring)
(32, 22), -- Hypersensitivity to Insulin
(33, 22), -- Hypersensitivity to Fluoxetine
-- Ketoconazole
(34, 3), -- Liver disease
-- Valacyclovir
(35, 4), -- Kidney disease (dosage adjustment may be needed)
-- Sertraline
(36, 22), -- Hypersensitivity to Sertraline
-- Lorazepam
(37, 22), -- Hypersensitivity to Lorazepam
-- Bumetanide
(38, 4), -- Kidney disease
-- Chlorthalidone
(39, 9), -- Diabetes
(39, 4), -- Kidney Disease
-- Glipizide
(40, 9), -- Diabetes (Requires careful monitoring)
-- Insulin lispro
(41, 9), -- Diabetes (Requires careful monitoring)
(41, 22), -- Hypersensitivity to Insulin
-- Fluticasone
(42, 22), -- Hypersensitivity to Fluticasone
-- Zafirlukast
(43, 22), -- Hypersensitivity to Zafirlukast
-- Enalapril
(44, 1), -- Pregnancy (especially second and third trimesters)
(44, 4), -- Kidney Disease
-- Valsartan
(45, 1), -- Pregnancy (especially second and third trimesters)
(45, 4), -- Kidney Disease
-- Formoterol
(46, 7), -- Heart Conditions (use with caution)
-- Amitriptyline
(47, 7), -- Heart conditions
-- Nystatin
(48, 22), -- Hypersensitivity to Nystatin
-- Acyclovir
(49, 4), -- Kidney disease (dosage adjustment may be needed)
-- Cetirizine
(50, 22); -- Hypersensitivity to Cetirizine

-- illnesses Table Data
INSERT INTO illnesses (name, descri, is_chronic) VALUES
('Headache', 'Pain in the head, ranging from mild to severe.', FALSE),
('Fever', 'An abnormally high body temperature, often a symptom of infection.', FALSE),
('Bacterial Infection', 'Infection caused by bacteria, treated with antibiotics.', FALSE), -- Often treated, but some can become chronic
('Fungal Infection', 'Infection caused by fungi, treated with antifungals.', FALSE), -- Some can be chronic
('High Blood Pressure (Hypertension)', 'A condition in which the force of the blood against the artery walls is too high.', TRUE),
('High Cholesterol', 'A condition in which there is too much cholesterol in the blood.', TRUE),
('Heartburn/Acid Reflux', 'A burning sensation in the chest caused by stomach acid flowing back up into the esophagus.', FALSE), -- Can become chronic (GERD)
('Seizures/Epilepsy', 'A neurological disorder characterized by recurrent seizures.', TRUE),
('Hypothyroidism', 'A condition in which the thyroid gland doesn''t produce enough thyroid hormone.', TRUE),
('Asthma', 'A chronic respiratory disease that causes inflammation and narrowing of the airways.', TRUE),
('Allergies (general)', 'An immune system reaction to a foreign substance (allergen).', FALSE), -- Can be seasonal or persistent
('Pain (general)', 'Physical discomfort caused by injury or illness.', FALSE), -- Can be acute or chronic
('Nausea and Vomiting', 'Feeling sick to the stomach and/or throwing up.', FALSE),
('Diarrhea', 'Frequent watery bowel movements.', FALSE),
('Muscle Spasms', 'Involuntary muscle contractions.', FALSE), -- Can be acute or related to chronic conditions
('Psychosis', 'A mental state characterized by a loss of contact with reality.', TRUE), -- Often associated with chronic mental illnesses
('Anxiety', 'A feeling of worry, nervousness, or unease, typically about an event or something with an uncertain outcome.', FALSE), -- Can be acute or chronic (anxiety disorders)
('Inflammation', 'A localized physical condition in which part of the body becomes reddened, swollen, hot, and often painful, especially as a reaction to injury or infection.', FALSE), -- Can be acute or chronic
('Blood Clots', 'A thickened mass of coagulated blood.', FALSE), -- Can be acute or a symptom of a chronic condition
('Diabetes Type 2', 'A metabolic disorder characterized by high blood sugar due to insulin resistance.', TRUE),
('Herpes Infections', 'Infections caused by herpes viruses, such as cold sores, genital herpes, and shingles.', TRUE), -- The virus remains in the body
('Depression', 'A mood disorder that causes a persistent feeling of sadness and loss of interest.', TRUE); -- Can be chronic or recurring

-- illness_treatments Table data
INSERT INTO illness_treatments (illness_id, med_id, efficiency) VALUES
-- Headache
(1, 1, 8),   -- Aspirin
(1, 2, 9),   -- Ibuprofen
(1, 3, 9),   -- Paracetamol
-- Fever
(2, 1, 7),   -- Aspirin
(2, 2, 8),   -- Ibuprofen
(2, 3, 9),   -- Paracetamol
-- Bacterial Infection
(3, 4, 9),   -- Amoxicillin
(3, 5, 8),   -- Ciprofloxacin
(3, 6, 8),   -- Doxycycline
(3, 7, 9),   -- Azithromycin
-- Fungal Infection
(4, 34, 8),  -- Ketoconazole
(4, 48, 9),  -- Nystatin
-- High Blood Pressure (Hypertension)
(5, 12, 9),  -- Losartan
(5, 13, 8),  -- Hydrochlorothiazide
(5, 14, 9),  -- Amlodipine
(5, 16, 9),  -- Lisinopril
(5, 20, 8),  -- Metoprolol
(5, 44, 9),  -- Enalapril
(5, 45, 9),  -- Valsartan
-- High Cholesterol
(6, 9, 9),   -- Atorvastatin
(6, 11, 9),  -- Simvastatin
-- Heartburn/Acid Reflux
(7, 10, 9),  -- Omeprazole
(7, 23, 7),  -- Ranitidine
-- Seizures/Epilepsy
(8, 15, 8),  -- Gabapentin (used for some types of seizures)
-- Hypothyroidism
(9, 17, 9),  -- Levothyroxine
-- Asthma
(10, 18, 8), -- Montelukast (for maintenance)
(10, 29, 9), -- Salbutamol (for acute attacks)
(10, 42, 9), -- Fluticasone (for maintenance)
(10, 46, 9), -- Formoterol (for maintenance)
-- Allergies (general)
(11, 30, 8), -- Cetirizine
-- Pain (general)
(12, 1, 7),  -- Aspirin
(12, 2, 9),  -- Ibuprofen
(12, 3, 9),  -- Paracetamol
(12, 15, 7), -- Gabapentin (for nerve pain)
-- Nausea and Vomiting
(13, 21, 9), -- Ondansetron
-- Diarrhea
(14, 22, 8), -- Loperamide
-- Muscle Spasms
(15, 24, 8), -- Cyclobenzaprine
-- Psychosis
(16, 25, 9), -- Quetiapine
-- Anxiety
(17, 26, 8), -- Alprazolam
(17, 36, 8), -- Sertraline
(17, 37, 8), -- Lorazepam
-- Inflammation
(18, 27, 9), -- Prednisone
-- Blood Clots
(19, 28, 9), -- Warfarin
(19, 19, 9), -- Clopidogrel
-- Diabetes Type 2
(20, 8, 9),   -- Metformin
(20, 32, 9), -- Insulin glargine
(20, 40, 8), -- Glipizide
(20, 41, 9), -- Insulin lispro
-- Herpes Infections
(21, 35, 9), -- Valacyclovir
(21, 49, 9), -- Acyclovir
-- Depression
(22, 3, 7), -- Paracetamol (used as a pain reliever that can be used for headache caused by depression)
(22, 33, 9), -- Fluoxetine (for treatment of depression)
(22, 36, 9), -- Sertraline (for treatment of depression)
(22, 47, 8); -- Amitriptyline (for treatment of depression)

