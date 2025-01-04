SELECT  m.id,
        md.price
    FROM        
        medicines m JOIN
        medicines_formats mf ON m.id = mf.med_id JOIN
        med_form forms ON mf.form_id = forms.id JOIN
        medicines_dosages md ON mf.id = md.med_format_id;

CREATE OR REPLACE VIEW v_all_prices AS (
    SELECT  m.id,
        md.price
    FROM        
        medicines m JOIN
        medicines_formats mf ON m.id = mf.med_id JOIN
        med_form forms ON mf.form_id = forms.id JOIN
        medicines_dosages md ON mf.id = md.med_format_id
);

SELECT * FROM medicines WHERE id IN (SELECT id FROM v_all_prices WHERE price < 5000);