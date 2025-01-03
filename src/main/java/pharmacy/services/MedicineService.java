package pharmacy.services;

import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.Medicine;

public class MedicineService extends Service {

    public MedicineService() throws Exception {
        super();
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

    public List<Medicine> getAll() throws Exception {
        List<Medicine> results = new ArrayList<>();

        List<Object> obj = this.getQueryManager().find(null, Medicine.class, null, null, null);
        populateList(results, obj);

        return results;
    }

    public List<Medicine> getAll(int start, int nb) throws Exception {
        List<Medicine> results = new ArrayList<>();

        List<Object> obj = this.getQueryManager().find(null, Medicine.class, null, null, null, start, nb);
        populateList(results, obj);

        return results;
    }
}
