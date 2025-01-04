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
}
