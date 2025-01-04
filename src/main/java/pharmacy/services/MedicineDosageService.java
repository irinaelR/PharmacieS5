package pharmacy.services;

import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.MedicinesDosage;

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
    
}
