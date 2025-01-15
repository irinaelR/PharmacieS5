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

SELECT DISTINCT sq.med_id FROM (
    SELECT t2.med_id, t2.efficiency
    FROM illness_treatments t1
    JOIN illness_treatments t2
    ON t1.illness_id = t2.illness_id
    WHERE t1.med_id = 3
    AND t2.med_id != 3
    ORDER BY t2.efficiency DESC
) sq;

SELECT DISTINCT ON (t2.med_id) t2.med_id
FROM illness_treatments t1
JOIN illness_treatments t2
  ON t1.illness_id = t2.illness_id
WHERE t1.med_id = 3
  AND t2.med_id != 3
ORDER BY t2.efficiency, t2.med_id DESC;

SELECT DISTINCT ON (t2.med_id) t2.med_id, t2.efficiency
FROM illness_treatments t1
JOIN illness_treatments t2
  ON t1.illness_id = t2.illness_id
WHERE t1.med_id = 3
  AND t2.med_id != 3
ORDER BY t2.efficiency DESC, t2.med_id;

SELECT m.name AS medicine, mfrm.name AS format, md.dose, mu.name AS unit
 FROM medicines AS m
 JOIN medicines_formats AS mf ON m.id = mf.med_id
 JOIN med_form AS mfrm ON mf.form_id = mfrm.id
 JOIN medicines_dosages AS md ON mf.id = md.med_format_id
 JOIN measuring_units AS mu ON md.unit_id = mu.id
 ORDER BY m.name; 