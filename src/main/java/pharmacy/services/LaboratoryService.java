package pharmacy.services;

import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.Laboratory;

public class LaboratoryService extends Service {

    public LaboratoryService() throws Exception {
        super();
    }    

    public Laboratory insert(Laboratory l) throws Exception {
        Object labObj = this.getQueryManager().insert(l, null);
        if (labObj != null) {
            return (Laboratory) labObj;
        } else {
            return null;
        }
    }

    // returns true if any row was successfully updated in the database
    // returns false otherwise
    public boolean update(Laboratory newLab) throws Exception {
        int affectedRows = this.getQueryManager().update(null, newLab);
        return affectedRows > 0;
    }

    // returns true if any row was successfully deleted in the database
    // returns false otherwise
    public boolean delete(Laboratory l) throws Exception {
        int affectedRows = this.getQueryManager().delete(null, l);
        return affectedRows > 0;
    }

    private void populateList(List<Laboratory> labList, List<Object> objList) {
        for (int i = 0; i < objList.size(); i++) {
            labList.add((Laboratory) objList.get(i));
        }
    }

    public List<Laboratory> getAll(String[] conditions, Object[] values, String[] afterWhere) throws Exception {
        List<Laboratory> results = new ArrayList<>();

        List<Object> objectList = this.getQueryManager().find(null, Laboratory.class, conditions, values, afterWhere);
        populateList(results, objectList);

        return results;
    }

    public List<Laboratory> getAll(String[] conditions, Object[] values, String[] afterWhere, int start, int nb) throws Exception {
        List<Laboratory> results = new ArrayList<>();

        List<Object> objectList = this.getQueryManager().find(null, Laboratory.class, conditions, values, afterWhere, start, nb);
        populateList(results, objectList);
        
        return results;
    }

    public Laboratory findById(int id) throws Exception {
        Laboratory lab = new Laboratory(id);

        Object result = this.getQueryManager().findById(null, lab);
        if (result != null) {
            lab = (Laboratory) result;
        } else {
            lab = null;
        }

        return lab;
    }

    
}
