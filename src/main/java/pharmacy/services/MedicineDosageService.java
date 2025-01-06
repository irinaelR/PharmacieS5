package pharmacy.services;

import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.Medicine;
import pharmacy.entities.MedicinesDosage;
import pharmacy.entities.MedicinesFormat;

public class MedicineDosageService extends Service {

    public MedicineDosageService() throws Exception {
        super();
    }

    public MedicinesDosage insert(MedicinesDosage md) throws Exception {
        Object o = this.getQueryManager().insert(md, null);
        if (o != null) {
            return (MedicinesDosage) o;
        }
        return null;
    }

    private void populateList(List<MedicinesDosage> mdList, List<Object> objList) {
        for (int i = 0; i < objList.size(); i++) {
            mdList.add((MedicinesDosage) objList.get(i));
        }
    }

    public List<MedicinesDosage> getAll(String[] conditions, Object[] args, String[] afterWhere) throws Exception {
        List<MedicinesDosage> mdList = new ArrayList<>();

        List<Object> results = this.getQueryManager().find(null, MedicinesDosage.class, conditions, args, afterWhere);
        populateList(mdList, results);

        return mdList;
    }
    
    public MedicinesDosage findById(int id) throws Exception {
        MedicinesDosage md = new MedicinesDosage();
        md.setId(id);

        Object obj = this.getQueryManager().findById(null, md);
        if (obj != null) {
            return (MedicinesDosage) obj;
        } else {
            return null;
        }
    }

    public String getDisplayName(MedicinesDosage md) throws Exception {
        int medFormatId = md.getMedFormatId();

        MedicinesFormatService mfs = new MedicinesFormatService();
        MedicinesFormat mf = mfs.findById(medFormatId);

        MedicineService ms = new MedicineService();
        Medicine m = ms.findById(mf.getMedId());

        String[] words = new String[] {
            m.getName(),
            String.valueOf(md.getDose()),
            md.getUnit().getName()
        };

        return String.join(" ", words);
    }
}
