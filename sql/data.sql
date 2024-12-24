

-- med_category Table data
INSERT INTO med_category (id, name) VALUES
(1, 'Analgesics'), -- Pain relievers
(2, 'Antibiotics'), -- Medications that fight bacterial infections
(3, 'Antidepressants'), -- Medications for treating depression
(4, 'Antifungals'), -- Medications that fight fungal infections
(5, 'Antihistamines'), -- Medications used to treat allergies
(6, 'Antihypertensives'), -- Medications used to lower blood pressure
(7, 'Antivirals'), -- Medications that fight viral infections
(8, 'Beta Blockers'), -- Medications used to treat high blood pressure, angina, etc.
(9, 'Calcium Channel Blockers'), -- Medications used to treat high blood pressure, angina, etc.
(10, 'Corticosteroids'), -- Anti-inflammatory and immunosuppressant medications
(11, 'Diuretics'), -- Medications that increase urine output
(12, 'NSAIDs (Nonsteroidal Anti-inflammatory Drugs)'), -- Pain relievers and anti-inflammatory drugs
(13, 'Proton Pump Inhibitors (PPIs)'), -- Medications that reduce stomach acid production
(14, 'Statins'), -- Medications used to lower cholesterol
(15, 'Antidiabetics'), -- Medications used to treat diabetes
(16, 'Antiplatelets'), -- Medications that prevent blood clotting
(17, 'Hormone Replacement'), -- Medications used to replace hormones
(18, 'Respiratory Medications'), -- Medications used to treat respiratory conditions
(19, 'Anticonvulsants'), -- Medications used to treat seizures
(20, 'Anti-Allergics'), -- Medications used to treat allergies
(21, 'Antiemetics'), -- For nausea and vomiting
(22, 'Laxatives'), -- For constipation
(23, 'Antacids'), -- For heartburn and indigestion
(24, 'Muscle Relaxants'), -- Medications used to relax muscles
(25, 'Antipsychotics'), -- Medications used to treat psychotic disorders
(26, 'Antianxiety Medications'), -- Medications used to treat anxiety
(27, 'Immunosuppressants'), -- Medications that suppress the immune system
(28, 'Anticoagulants'), -- Medications that prevent blood clotting (blood thinners)
(29, 'Bronchodilators'), -- Medications that open up the airways in the lungs
(30, 'Selective Serotonin Reuptake Inhibitors (SSRIs)'), -- Subcategory of Antidepressants
(31, 'Benzodiazepines'), -- Subcategory of Antianxiety Medications
(32, 'Loop Diuretics'), -- Subcategory of Diuretics
(33, 'Thiazide Diuretics'), -- Subcategory of Diuretics
(34, 'Biguanides'), -- Subcategory of Antidiabetics (Metformin's class)
(35, 'Insulins'), -- Subcategory of Antidiabetics
(36, 'Inhaled Corticosteroids'), -- Subcategory of Corticosteroids
(37, 'Leukotriene Receptor Antagonists'), -- More specific for Montelukast
(38, 'ACE Inhibitors'), -- Subcategory of Antihypertensives (Lisinopril's class)
(39, 'Angiotensin II Receptor Blockers (ARBs)'), -- Subcategory of Antihypertensives (Losartan's class)
(40, 'Beta-2 Agonists'); -- Subcategory of Bronchodilators (Salbutamol's class)

-- tlab_types Table data
INSERT INTO lab_types (id, name) VALUES
(1, 'Pharmaceutical Company'),
(2, 'Generic Drug Manufacturer'),
(3, 'Biotechnology Company'),
(4, 'Research Laboratory'),
(5, 'Compounding Pharmacy');

-- laboratories Table data
INSERT INTO laboratories (id, name, type_id) VALUES
(1, 'Pfizer', 1), -- Pharmaceutical Company
(2, 'Teva Pharmaceuticals', 2), -- Generic Drug Manufacturer
(3, 'Novartis', 1), -- Pharmaceutical Company
(4, 'Mylan', 2), -- Generic Drug Manufacturer (now Viatris)
(5, 'Sanofi', 1), -- Pharmaceutical Company
(6, 'AstraZeneca', 1), -- Pharmaceutical Company
(7, 'Johnson & Johnson', 1), -- Pharmaceutical Company
(8, 'Actavis', 2), -- Generic Drug Manufacturer (now part of Teva)
(9, 'Sun Pharmaceutical', 2), -- Generic Drug Manufacturer
(10, 'Roche', 3), -- Biotechnology Company
(11, 'Hikma Pharmaceuticals', 2), -- Generic Drug Manufacturer
(12, 'Bristol Myers Squibb', 1), -- Pharmaceutical Company
(13, 'Abbott Laboratories', 1), -- Pharmaceutical Company
(14, 'Cipla', 2), -- Generic Drug Manufacturer
(15, 'Lupin Limited', 2), -- Generic Drug Manufacturer
(16, 'Galenika', 1), -- Serbian company, presence in Africa
(17, 'Aspen Pharmacare', 1), -- South African company, strong African presence
(18, 'Adcock Ingram', 1), -- South African company
(19, 'Strides Pharma Science', 2), -- Indian company, focus on emerging markets
(20, 'Hetero Labs', 2), -- Indian company, major generic manufacturer
(21, 'Emcure Pharmaceuticals', 2), -- Indian company
(22, 'IPCA Laboratories', 2), -- Indian company
(23, 'Unique Pharmaceutical Laboratories', 2), -- Indian company
(24, 'Medreich Sterilab Limited', 2), -- Indian company
(25, 'Laboratoires Biopharma Madagascar', 5); -- Local Madagascan lab (Compounding/Distribution)

-- medicines Table data
INSERT INTO medicines (id, name, needs_notice, category_id, lab_id) VALUES
(1, 'Aspirin', false, 1, 19), -- Analgesic (Likely generic from India - Strides Pharma)
(2, 'Ibuprofen', true, 12, 20), -- NSAID (Likely generic from India - Hetero Labs)
(3, 'Paracetamol', false, 1, 21), -- Analgesic (Likely generic from India - Emcure)
(4, 'Amoxicillin', false, 2, 22), -- Antibiotic (Likely generic from India - IPCA)
(5, 'Ciprofloxacin', false, 2, 23), -- Antibiotic (Likely generic from India - Unique Pharma)
(6, 'Doxycycline', false, 2, 24), -- Antibiotic (Likely generic from India - Medreich)
(7, 'Azithromycin', true, 2, 19), -- Antibiotic (Likely generic from India - Strides Pharma)
(8, 'Metformin', false, 15, 20), -- Antidiabetic (Likely generic from India - Hetero Labs)
(9, 'Atorvastatin', true, 14, 17), -- Statin (Aspen Pharmacare - strong African presence)
(10, 'Omeprazole', false, 13, 19), -- PPI (Likely generic from India - Strides Pharma)
(11, 'Simvastatin', false, 14, 20), -- Statin (Likely generic from India - Hetero Labs)
(12, 'Losartan', false, 6, 21), -- Antihypertensive (Likely generic from India - Emcure)
(13, 'Hydrochlorothiazide', true, 11, 22), -- Diuretic (Likely generic from India - IPCA)
(14, 'Amlodipine', false, 9, 23), -- Calcium Channel Blocker (Likely generic from India - Unique Pharma)
(15, 'Gabapentin', true, 19, 24), -- Anticonvulsant (Likely generic from India - Medreich)
(16, 'Lisinopril', true, 6, 19), -- Antihypertensive (Likely generic from India - Strides Pharma)
(17, 'Levothyroxine', true, 17, 20), -- Hormone Replacement (Likely generic from India - Hetero Labs)
(18, 'Montelukast', false, 18, 21), -- Respiratory Medication/Anti-Allergic (Likely generic from India - Emcure)
(19, 'Clopidogrel', true, 16, 22), -- Antiplatelet (Likely generic from India - IPCA)
(20, 'Metoprolol', true, 8, 23), -- Beta Blocker (Likely generic from India - Unique Pharma)
(21, 'Ondansetron', true, 21, 24), -- Antiemetic (Likely generic from India - Medreich)
(22, 'Loperamide', false, 22, 19), -- Anti-diarrheal, can be considered a type of laxative in reverse (Likely generic from India - Strides Pharma)
(23, 'Ranitidine', false, 23, 20), -- Antacid (though less commonly used now due to safety concerns; could be replaced with Famotidine) (Likely generic from India - Hetero Labs)
(24, 'Cyclobenzaprine', true, 24, 21), -- Muscle Relaxant (Likely generic from India - Emcure)
(25, 'Quetiapine', true, 25, 22), -- Antipsychotic (Likely generic from India - IPCA)
(26, 'Alprazolam', true, 26, 23), -- Antianxiety Medication (Likely generic from India - Unique Pharma)
(27, 'Prednisone', true, 10, 24), -- Corticosteroid (Likely generic from India - Medreich)
(28, 'Warfarin', true, 28, 19), -- Anticoagulant (Likely generic from India - Strides Pharma)
(29, 'Salbutamol', true, 29, 17), -- Bronchodilator (Also known as Albuterol) (Aspen Pharmacare or generic from India)
(30, 'Cetirizine', false, 5, 20), -- Antihistamine (Likely generic from India - Hetero Labs)
(31, 'Furosemide', true, 11, 21), -- Diuretic (Likely generic from India - Emcure)
(32, 'Insulin glargine', true, 15, 5), -- Antidiabetic (Sanofi)
(33, 'Fluoxetine', true, 30, 22), -- Antidepressant (Likely generic from India - IPCA)
(34, 'Ketoconazole', true, 4, 23), -- Antifungal (Likely generic from India - Unique Pharma)
(35, 'Valacyclovir', true, 7, 24), -- Antiviral (Likely generic from India - Medreich)
(36, 'Sertraline', true, 30, 19), -- SSRI Antidepressant (Likely generic from India - Strides Pharma)
(37, 'Lorazepam', true, 31, 20), -- Benzodiazepine (Likely generic from India - Hetero Labs)
(38, 'Bumetanide', true, 32, 21), -- Loop Diuretic (Likely generic from India - Emcure)
(39, 'Chlorthalidone', true, 33, 22), -- Thiazide Diuretic (Likely generic from India - IPCA)
(40, 'Glipizide', true, 15, 23), -- Antidiabetic (Sulfonylurea, another class) (Likely generic from India - Unique Pharma)
(41, 'Insulin lispro', true, 35, 1), -- Rapid-acting Insulin (Pfizer)
(42, 'Fluticasone', true, 36, 6), -- Inhaled Corticosteroid (AstraZeneca)
(43, 'Zafirlukast', true, 37, 24), -- Leukotriene Receptor Antagonist (Likely generic from India - Medreich)
(44, 'Enalapril', true, 38, 19), -- ACE Inhibitor (Likely generic from India - Strides Pharma)
(45, 'Valsartan', true, 39, 20), -- ARB (Likely generic from India - Hetero Labs)
(46, 'Formoterol', true, 40, 3), -- Long-acting Beta-2 Agonist (Novartis)
(47, 'Amitriptyline', true, 3, 21), -- Tricyclic Antidepressant (older class, still used) (Likely generic from India - Emcure)
(48, 'Nystatin', true, 4, 22), -- Antifungal (often topical) (Likely generic from India - IPCA)
(49, 'Acyclovir', true, 7, 23), -- Antiviral (Likely generic from India - Unique Pharma)
(50, 'Cetirizine', false, 5, 24); -- Antihistamine (Likely generic from India - Medreich)

-- measuring_nuits Table data
INSERT INTO measuring_units (id, name) VALUES
(1, 'mg'),   -- Milligram
(2, 'g'),    -- Gram
(3, 'mcg'),  -- Microgram
(4, 'mL'),   -- Milliliter
(5, 'L'),    -- Liter
(6, 'IU'),   -- International Unit
(7, '%'),    -- Percentage (e.g., concentration)
(8, 'U'),    -- Unit (e.g., insulin units)
(9, 'mmol'), -- Millimole
(10, 'mEq'), -- Milliequivalent
(11, 'drop'), -- Drop (singular)
(12, 'puf'),  -- Puff (shortened)
(13, 'cap'),  -- Capsule (shortened)
(14, 'tab'),  -- Tablet (shortened)
(15, 'sup'),  -- Suppository (shortened)
(16, 'vial'); -- Vial

-- med_form Table data
INSERT INTO med_form (id, name) VALUES
(1, 'Tablet'),
(2, 'Capsule'),
(3, 'Syrup'),
(4, 'Suspension'),
(5, 'Solution'),
(6, 'Injection'),
(7, 'Cream'),
(8, 'Ointment'),
(9, 'Lotion'),
(10, 'Gel'),
(11, 'Suppository'),
(12, 'Pessary'), -- Vaginal suppository
(13, 'Inhaler'),
(14, 'Nebulizer Solution'),
(15, 'Eye Drops'),
(16, 'Ear Drops'),
(17, 'Nasal Spray'),
(18, 'Transdermal Patch'),
(19, 'Powder for Reconstitution'),
(20, 'Elixir'),
(21, 'Emulsion'),
(22, 'Aerosol'),
(23, 'Paste'),
(24, 'Mouthwash'),
(25, 'Gargle'),
(26, 'Enema'),
(27, 'Implant'),
(28, 'Lozenge/Troche');

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
(1, 0.50, 500, 1),   -- Aspirin - Tablet
(2, 8.00, 100, 1),   -- Aspirin - Inhaler
(3, 1.00, 200, 1),   -- Ibuprofen - Tablet
(4, 1.50, 400, 1),   -- Ibuprofen - Capsule
(5, 4.00, 100, 4),   -- Ibuprofen - Suspension
(6, 0.30, 500, 1),   -- Paracetamol - Tablet
(7, 2.50, 120, 4),   -- Paracetamol - Syrup
(8, 1.00, 250, 1),   -- Paracetamol - Suppository
(9, 3.00, 500, 1),   -- Amoxicillin - Capsule
(10, 5.00, 250, 4),  -- Amoxicillin - Suspension
(11, 5.00, 500, 1),  -- Ciprofloxacin - Tablet
(12, 10.00, 200, 4), -- Ciprofloxacin - Solution
(13, 4.00, 100, 1),  -- Doxycycline - Capsule
(14, 4.50, 100, 1),  -- Doxycycline - Tablet
(15, 6.00, 250, 1),  -- Azithromycin - Tablet
(16, 8.00, 200, 4),  -- Azithromycin - Suspension
(17, 1.50, 500, 1),  -- Metformin - Tablet
(18, 8.00, 10, 1),   -- Atorvastatin - Tablet
(19, 4.00, 20, 1),   -- Omeprazole - Capsule
(20, 5.00, 40, 1),   -- Omeprazole - Tablet
(21, 6.00, 20, 1),   -- Simvastatin - Tablet
(22, 3.00, 50, 1),   -- Losartan - Tablet
(23, 2.00, 25, 1),   -- Hydrochlorothiazide - Tablet
(24, 4.00, 5, 1),    -- Amlodipine - Tablet
(25, 5.00, 300, 1),  -- Gabapentin - Capsule
(26, 6.00, 100, 1),  -- Gabapentin - Tablet
(27, 3.00, 10, 1),   -- Lisinopril - Tablet
(28, 8.00, 100, 3),  -- Levothyroxine - Tablet
(29, 9.00, 10, 1),   -- Montelukast - Tablet
(30, 9.50, 5, 1),   -- Montelukast - Chewable
(31, 7.00, 75, 1),   -- Clopidogrel - Tablet
(32, 4.00, 50, 1),   -- Metoprolol - Tablet
(33, 12.00, 5, 4),  -- Metoprolol - Injection
(34, 8.00, 4, 4),   -- Ondansetron - Injection
(35, 6.00, 8, 1),   -- Ondansetron - Tablet
(36, 1.50, 2, 1),   -- Loperamide - Capsule
(37, 1.00, 2, 1),   -- Loperamide - Tablet
(38, 3.00, 150, 1),  -- Ranitidine - Tablet
(39, 2.50, 75, 4),  -- Ranitidine - Syrup
(40, 5.00, 10, 1),   -- Cyclobenzaprine - Tablet
(41, 7.00, 25, 1),   -- Quetiapine - Tablet
(42, 4.00, 0.5, 1),   -- Alprazolam - Tablet
(43, 6.00, 5, 1),    -- Prednisone - Tablet
(44, 9.00, 5, 1),    -- Warfarin - Tablet
(45, 12.00, 100, 3), -- Salbutamol - Inhaler
(46, 15.00, 5, 4),  -- Salbutamol - Nebulizer
(47, 3.00, 10, 1),   -- Cetirizine - Tablet
(48, 2.50, 5, 4),   -- Cetirizine - Syrup
(49, 5.00, 40, 1),   -- Furosemide - Tablet
(50, 8.00, 10, 4),   -- Furosemide - Injection
(51, 20.00, 100, 8), -- Insulin glargine - Injection
(52, 4.00, 20, 1),   -- Fluoxetine - Tablet
(53, 3.50, 20, 4),   -- Fluoxetine - Syrup
(54, 8.00, 20, 7),   -- Ketoconazole - Cream
(55, 10.00, 200, 1), -- Ketoconazole - Tablet
(56, 12.00, 500, 1), -- Valacyclovir - Tablet
(57, 5.00, 50, 1),   -- Sertraline - Tablet
(58, 3.00, 1, 1),    -- Lorazepam - Tablet
(59, 15.00, 4, 4),  -- Lorazepam - Injection
(60, 4.00, 1, 1),    -- Bumetanide - Tablet
(61, 10.00, 0.5, 4), -- Bumetanide - Injection
(62, 2.00, 25, 1),   -- Chlorthalidone - Tablet
(63, 3.00, 5, 1),    -- Glipizide - Tablet
(64, 18.00, 100, 8), -- Insulin lispro - Injection
(65, 15.00, 50, 3), -- Fluticasone - Inhaler
(66, 12.00, 50, 4), -- Fluticasone - Nasal Spray
(67, 10.00, 10, 1),  -- Zafirlukast - Tablet
(68, 2.00, 10, 1),   -- Enalapril - Tablet
(69, 4.00, 80, 1),   -- Valsartan - Tablet
(70, 18.00, 12, 3), -- Formoterol - Inhaler
(71, 3.00, 25, 1),   -- Amitriptyline - Tablet
(72, 6.00, 100000, 6),-- Nystatin - Cream
(73, 5.00, 100000, 4),-- Nystatin - Suspension
(74, 8.00, 200, 1),   -- Acyclovir - Tablet
(75, 7.00, 5, 7),   -- Acyclovir - Cream
(76, 3.00, 10, 1),   -- Cetirizine - Tablet
(77, 2.50, 5, 4);   -- Cetirizine - Syrup

-- medical_constraints Table data
INSERT INTO medical_constraints (id, name) VALUES
(1, 'Pregnancy'),
(2, 'Breastfeeding'),
(3, 'Liver Disease'),
(4, 'Kidney Disease'),
(5, 'Asthma'),
(6, 'Peptic Ulcer'),
(7, 'Heart Failure'),
(8, 'High Blood Pressure (Uncontrolled)'),
(9, 'Diabetes'),
(10, 'Allergy to Aspirin'),
(11, 'Allergy to Ibuprofen'),
(12, 'Allergy to Penicillin (Amoxicillin)'),
(13, 'Allergy to Fluoroquinolones (Ciprofloxacin)'),
(14, 'Allergy to Tetracyclines (Doxycycline)'),
(15, 'Allergy to Macrolides (Azithromycin)'),
(16, 'Active Bleeding'),
(17, 'Blood Clotting Disorders'),
(18, 'G6PD Deficiency'),
(19, 'Epilepsy'),
(20, 'Severe Renal Impairment'),
(21, 'Severe Hepatic Impairment'),
(22, 'Hypersensitivity to the specific medication'),
(23, 'Children under 12 years old'),
(24, 'Elderly patients (use with caution)');

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
INSERT INTO illnesses (id, name) VALUES
(1, 'Headache'),
(2, 'Fever'),
(3, 'Bacterial Infection'),
(4, 'Fungal Infection'),
(5, 'High Blood Pressure (Hypertension)'),
(6, 'High Cholesterol'),
(7, 'Heartburn/Acid Reflux'),
(8, 'Seizures/Epilepsy'),
(9, 'Hypothyroidism'),
(10, 'Asthma'),
(11, 'Allergies (general)'),
(12, 'Pain (general)'),
(13, 'Nausea and Vomiting'),
(14, 'Diarrhea'),
(15, 'Muscle Spasms'),
(16, 'Psychosis'),
(17, 'Anxiety'),
(18, 'Inflammation'),
(19, 'Blood Clots'),
(20, 'Diabetes Type 2'),
(21, 'Herpes Infections'),
(22, 'Depression');

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

