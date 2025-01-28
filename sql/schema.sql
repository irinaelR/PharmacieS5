\c postgres 

DROP DATABASE IF EXISTS pharmacy_s5;

CREATE DATABASE pharmacy_s5;

\c pharmacy_s5;

-- e.g. homeopathy, cosmetology, ...
CREATE TABLE lab_types (
    id SERIAL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(name)
);

-- e.g. Homeopharma, Denk, ...
CREATE TABLE laboratories (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    type_id INT,
    PRIMARY KEY(id),
    UNIQUE(name),
    FOREIGN KEY(type_id) REFERENCES lab_types(id) ON DELETE CASCADE
);

-- e.g. 'mg', 'cl', ...
CREATE TABLE measuring_units (
    id SERIAL,
    name VARCHAR(4) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(name)
);

-- e.g. painkiller, antihistamines, ...
CREATE TABLE med_category (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(name)
);

-- e.g. syrup, tablets, ...
CREATE TABLE med_form (
    id SERIAL,
    name VARCHAR(255),
    PRIMARY KEY(id),
    UNIQUE(name)
);

-- e.g. doliprane, aerius, ...
CREATE TABLE medicines (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    needs_notice BOOLEAN NOT NULL DEFAULT true,
    category_id INT,
    lab_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(category_id) REFERENCES med_category(id) ON DELETE CASCADE,
    FOREIGN KEY(lab_id) REFERENCES laboratories(id) ON DELETE CASCADE
);

-- ManyToMany relation table between medicines and med_form
-- e.g. Advil can come in both tablets and syrup form
CREATE TABLE medicines_formats (
    id SERIAL,
    med_id INT,
    form_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(med_id) REFERENCES medicines(id) ON DELETE CASCADE,
    FOREIGN KEY(form_id) REFERENCES med_form(id) ON DELETE CASCADE
);

-- the same medicines_format can come in different dosages and cost a different price
-- e.g. Doliprane tablets 500mg and 1000mg
CREATE TABLE medicines_dosages (
    id SERIAL,
    med_format_id INT,
    price DOUBLE PRECISION NOT NULL CHECK (price > 0),
    dose DOUBLE PRECISION NOT NULL CHECK (dose > 0),
    unit_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(med_format_id) REFERENCES medicines_formats(id) ON DELETE CASCADE,
    FOREIGN KEY(unit_id) REFERENCES measuring_units(id) ON DELETE CASCADE
);

-- e.g. headache, stomachache, ...
CREATE TABLE illnesses (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    descri VARCHAR(255),
    is_chronic BOOLEAN NOT NULL DEFAULT false,
    PRIMARY KEY(id)
);

-- ManyToMany relation table between illnesses and medicines
-- efficiency is a scale from 1 (low efficiency) to 10 (high efficiency)
CREATE TABLE illness_treatments (
    id SERIAL,
    illness_id INT,
    med_id INT,
    efficiency INT NOT NULL DEFAULT 1,
    PRIMARY KEY(id),
    FOREIGN KEY(med_id) REFERENCES medicines(id) ON DELETE CASCADE,
    FOREIGN KEY(illness_id) REFERENCES illnesses(id) ON DELETE CASCADE
);

-- Table to store conditions that might make someone unable to take a certain medicine
-- e.g. diabetic, celiac, pregnant people, ...
CREATE TABLE medical_constraints (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

-- Table to store which conditions from medical_constraints may NOT take a medicine
CREATE TABLE medicines_restrictions (
    id SERIAL,
    med_id INT,
    constraint_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(med_id) REFERENCES medicines(id) ON DELETE CASCADE,
    FOREIGN KEY(constraint_id) REFERENCES medical_constraints(id) ON DELETE CASCADE
);

CREATE TABLE medicines_transactions (
    id SERIAL,
    med_dosage_id INT,
    transaction_date TIMESTAMP NOT NULL,
    in_value INT NOT NULL CHECK (in_value >= 0),
    out_value INT NOT NULL CHECK (out_value >= 0),
    price DOUBLE PRECISION NOT NULL CHECK (price > 0),
    PRIMARY KEY(id),
    FOREIGN KEY(med_dosage_id) REFERENCES medicines_dosages(id)
);

CREATE VIEW v_stocks_dosages AS (
    SELECT med_dosage_id, SUM(in_value) - SUM(out_value) AS quantity FROM medicines_transactions GROUP BY med_dosage_id
);

-- Création de la table pharmacy_client
CREATE TABLE pharmacy_client (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Création de la table age_group
CREATE TABLE age_group (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Création de la table med_age_group (liaison entre médicament et groupe d'âge)
CREATE TABLE med_age_group (
    id_med_dosage INT,
    id_age_group INT,
    PRIMARY KEY (id_med_dosage, id_age_group), 
    FOREIGN KEY (id_med_dosage) REFERENCES medicines_dosages (id),
    FOREIGN KEY (id_age_group) REFERENCES age_group (id)
);

CREATE TABLE genders (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20)
);


CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    emp_name VARCHAR(255) NOT NULL,
    gender_id INT,
    FOREIGN KEY(gender_id) REFERENCES genders(id)
);

-- Création de la table sales
CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    date_sales DATE NOT NULL,
    id_client INT,
    employee_id INT,
    FOREIGN KEY(employee_id) REFERENCES employees(id),
    FOREIGN KEY (id_client) REFERENCES pharmacy_client (id)
);

ALTER TABLE sales
ADD COLUMN commission DOUBLE PRECISION DEFAULT 5;

-- Création de la table sales_details
CREATE TABLE sales_details (
    id SERIAL PRIMARY KEY,
    id_sales INT,
    id_med_dosage INT,
    quantity INT,
    unit_price DECIMAL(10, 2), 
    FOREIGN KEY (id_sales) REFERENCES sales (id),
    FOREIGN KEY (id_med_dosage) REFERENCES medicines_dosages (id) 
);

ALTER TABLE sales_details
ALTER COLUMN unit_price SET DATA TYPE DOUBLE PRECISION;

CREATE TABLE products_of_the_month (
    id SERIAL PRIMARY KEY,
    id_medicine INT,
    date_validity DATE NOT NULL,
    FOREIGN KEY(id_medicine) REFERENCES medicines(id)
);

CREATE TABLE histo_price_med (
    id SERIAL PRIMARY KEY,
    med_dosage_id INT NOT NULL,
    date_start DATE NOT NULL,
    price DOUBLE PRECISION NOT NULL,
    FOREIGN KEY(med_dosage_id) REFERENCES medicines_dosages(id)
);


INSERT INTO histo_price_med (med_dosage_id, price, date_start) values 
(1,2250,'2024-12-12'),
(2,36000,'2024-12-12'),
(3,4500,'2024-12-12'),
(4,6750,'2024-12-12'),
(5,18000,'2024-12-12');
