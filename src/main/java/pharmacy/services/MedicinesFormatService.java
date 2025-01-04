package pharmacy.services;

import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.MedicinesDosage;
import pharmacy.entities.MedicinesFormat;

public class MedicinesFormatService extends Service {

    private MedicineDosageService medicineDosageService;

    public MedicinesFormatService() throws Exception {
        super();
        medicineDosageService = new MedicineDosageService();
    }

    public MedicinesFormat insert(MedicinesFormat mf) throws Exception {
        Object obj = this.getQueryManager().insert(mf, null);
        if (obj != null) {
            return (MedicinesFormat) obj;
        }
        return null;
    }

    public MedicinesFormat exists(MedicinesFormat mf) throws Exception {
        String[] conditions = new String[] {
            "med_id = ?",
            "form_id = ?"
        };

        Object[] args = new Object[] {
            mf.getMedId(),
            mf.getFormId()
        };

        List<Object> searchResults = this.getQueryManager().find(null, mf.getClass(), conditions, args, null, 0, 1);
        if(searchResults.size() > 0) {
            return (MedicinesFormat) searchResults.get(0);
        } else {
            return null;
        }
    } 

    private void populateList(List<MedicinesFormat> mfList, List<Object> objList) {
        for (int i = 0; i < objList.size(); i++) {
            mfList.add((MedicinesFormat) objList.get(i));
        }
    }
    
    public List<MedicinesFormat> getAll(String[] conditions, Object[] args, String[] afterWhere) throws Exception {
        List<MedicinesFormat> mfList = new ArrayList<>();

        List<Object> results = this.getQueryManager().find(null, MedicinesFormat.class, conditions, args, afterWhere);
        populateList(mfList, results);

        return mfList;
    }

    public List<MedicinesDosage> getAllDosages(MedicinesFormat mf) throws Exception {
        String[] conditions = new String[] {
            "med_format_id = ?"
        };

        Object[] values = new Object[] {
            mf.getId()
        };

        return medicineDosageService.getAll(conditions, values, null);
    }
     
}
