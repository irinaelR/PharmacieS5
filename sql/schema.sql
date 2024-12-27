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
    FOREIGN KEY(type_id) REFERENCES lab_types(id)
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
    FOREIGN KEY(category_id) REFERENCES med_category(id),
    FOREIGN KEY(lab_id) REFERENCES laboratories(id)
);

-- ManyToMany relation table between medicines and med_form
-- e.g. Advil can come in both tablets and syrup form
CREATE TABLE medicines_formats (
    id SERIAL,
    med_id INT,
    form_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(med_id) REFERENCES medicines(id),
    FOREIGN KEY(form_id) REFERENCES med_form(id)
);

-- the same medicines_format can come in different dosages and cost a different price
-- e.g. Doliprane tablets 500mg and 1000mg
CREATE TABLE medicines_dosages (
    id SERIAL,
    med_format_id INT,
    price DECIMAL(15, 2) NOT NULL CHECK (price > 0),
    dose DOUBLE PRECISION NOT NULL CHECK (dose > 0),
    unit_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(med_format_id) REFERENCES medicines_formats(id),
    FOREIGN KEY(unit_id) REFERENCES measuring_units(id)
);

-- e.g. headache, stomachache, ...
CREATE TABLE illnesses (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
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
    FOREIGN KEY(med_id) REFERENCES medicines(id),
    FOREIGN KEY(illness_id) REFERENCES illnesses(id)
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
    FOREIGN KEY(med_id) REFERENCES medicines(id),
    FOREIGN KEY(constraint_id) REFERENCES medical_constraints(id)
);