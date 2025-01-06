package pharmacy.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pharmacy.entities.Medicine;
import pharmacy.entities.MedicinesDosage;
import pharmacy.entities.MedicinesFormat;

public class MedicineService extends Service {

    MedicinesFormatService medicinesFormatService;

    public MedicinesFormatService getMedicinesFormatService() {
        return medicinesFormatService;
    }

    public MedicineService() throws Exception {
        super();
        this.medicinesFormatService = new MedicinesFormatService();
    }
    
    public Medicine insert(Medicine m) throws Exception {
        Object o = this.getQueryManager().insert(m, null);
        Medicine result = new Medicine();

        result = (o != null) ? (Medicine) o : null;
        return result;
    }

    public boolean update(Medicine m) throws Exception {
        int affectedRows = this.getQueryManager().update(null, m);
        return affectedRows > 0;
    }

    public boolean delete(Medicine m) throws Exception {
        int affectedRows = this.getQueryManager().delete(null, m);
        return affectedRows > 0;
    }

    private void populateList(List<Medicine> medsList, List<Object> objList) {
        for(Object o : objList) {
            medsList.add((Medicine) o);
        }
    }

    public List<Medicine> getAll(String[] conditions, Object[] values, String[] afterWhere) throws Exception {
        List<Medicine> results = new ArrayList<>();

        List<Object> obj = this.getQueryManager().find(null, Medicine.class, conditions, values, afterWhere);
        populateList(results, obj);

        return results;
    }

    public List<Medicine> getAll(String[] conditions, Object[] values, String[] afterWhere, int start, int nb) throws Exception {
        List<Medicine> results = new ArrayList<>();

        List<Object> obj = this.getQueryManager().find(null, Medicine.class, conditions, values, afterWhere, start, nb);
        populateList(results, obj);

        return results;
    }

    public Medicine findById(int id) throws Exception {
        Medicine m = new Medicine();
        m.setId(id);

        Object result = this.getQueryManager().findById(null, m);
        if (result != null) {
            m = (Medicine) result;
        } else {
            m = null;
        }

        return m;
    }

    public List<MedicinesFormat> getAllFormats(Medicine m) throws Exception {
        String[] conditions = new String[] {
            "med_id = ?"
        };
        Object[] values = new Object[] {
          m.getId()  
        };

        return this.medicinesFormatService.getAll(conditions, values, null);
    }

    public Map<MedicinesFormat, List<MedicinesDosage>> getAllFormatsDosages(Medicine m) throws Exception {
        List<MedicinesFormat> formats = getAllFormats(m);

        Map<MedicinesFormat, List<MedicinesDosage>> results = new HashMap<>();

        for (MedicinesFormat format : formats) {
            List<MedicinesDosage> mdList = medicinesFormatService.getAllDosages(format);

            results.put(format, mdList);
        }

        return results;
    }

    public String[] filterConditions(String laboratory, String categ, String needsNotice, String constraint, String minPriceStr, String maxPriceStr) {
        List<String> conditionsList = new ArrayList<>();
        if (laboratory != null && !laboratory.isBlank() && !laboratory.equals("-1")) {
            conditionsList.add("lab_id = ?");
        }
        if (categ != null && !categ.isBlank() && !categ.equals("-1")) {
            conditionsList.add("category_id = ?");
        }
        if (needsNotice != null && !needsNotice.isBlank()) {
            conditionsList.add("needs_notice = ?");
        }
        if (constraint != null && !constraint.isBlank() && !constraint.equals("-1")) {
            conditionsList.add("id IN (SELECT med_id FROM medicines_restrictions WHERE constraint_id = ?)");
        }
        if (minPriceStr != null && !minPriceStr.isBlank()) {
            conditionsList.add("id IN (SELECT id FROM v_all_prices WHERE price > ?)");
        }
        if (maxPriceStr != null && !maxPriceStr.isBlank()) {
            conditionsList.add("id IN (SELECT id FROM v_all_prices WHERE price < ?)");
        }

        return conditionsList.toArray(new String[conditionsList.size()]);
    }

    public Object[] filterValues(String laboratory, String categ, String needsNotice, String constraint, String minPriceStr, String maxPriceStr) {
        List<Object> valuesList = new ArrayList<>();
        if (laboratory != null && !laboratory.isBlank() && !laboratory.equals("-1")) {
            valuesList.add(Integer.valueOf(laboratory));
        }
        if (categ != null && !categ.isBlank() && !categ.equals("-1")) {
            valuesList.add(Integer.valueOf(categ));
        }
        if (needsNotice != null && !needsNotice.isBlank()) {
            valuesList.add(Boolean.valueOf(needsNotice));
        }
        if (constraint != null && !constraint.isBlank() && !constraint.equals("-1")) {
            valuesList.add(Integer.valueOf(constraint));
        }
        if (minPriceStr != null && !minPriceStr.isBlank()) {
            valuesList.add(Double.valueOf(minPriceStr));
        }
        if (maxPriceStr != null && !maxPriceStr.isBlank()) {
            valuesList.add(Double.valueOf(maxPriceStr));
        }

        return valuesList.toArray();
    }
}
