package pharmacy.services;

import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.Illness;

public class IllnessService extends Service {

    public IllnessService() throws Exception {
        super();
    }

    public Illness insert(Illness illness) throws Exception {
        Object iObj = this.getQueryManager().insert(illness, null);
        if (iObj != null) {
            return (Illness) iObj;
        } else {
            return null;
        }
    }

    // returns true if any row was successfully updated in the database
    // returns false otherwise
    public boolean update(Illness newIll) throws Exception {
        int affectedRows = this.getQueryManager().update(null, newIll);
        return affectedRows > 0;
    }

    // returns true if any row was successfully deleted in the database
    // returns false otherwise
    public boolean delete(Illness l) throws Exception {
        int affectedRows = this.getQueryManager().delete(null, l);
        return affectedRows > 0;
    }

    private void populateList(List<Illness> illList, List<Object> objList) {
        for (int i = 0; i < objList.size(); i++) {
            illList.add((Illness) objList.get(i));
        }
    }

    public List<Illness> getAll(String[] conditions, Object[] values, String[] afterWhere) throws Exception {
        List<Illness> results = new ArrayList<>();

        List<Object> objList = this.getQueryManager().find(null, Illness.class,  conditions, values, afterWhere);
        populateList(results, objList);

        return results;
    }

    public List<Illness> getAll(String[] conditions, Object[] values, String[] afterWhere, int start, int nb) throws Exception {
        List<Illness> results = new ArrayList<>();

        List<Object> objList = this.getQueryManager().find(null, Illness.class,  conditions, values, afterWhere, start, nb);
        populateList(results, objList);

        return results;
    }

    public Illness findById(int id) throws Exception {
        Illness i = new Illness();
        i.setId(id);

        Object result = this.getQueryManager().findById(null, i);
        if (result != null) {
            i = (Illness) result;
        } else {
            i = null;
        }

        return i;
    }

    public String[] filterConditions(String name, int medId, Boolean isChronic) {
        List<String> conditions = new ArrayList<>();

        if(name != null && !name.isBlank()) {
            conditions.add("name LIKE ?");
        }
        if (medId != -1) {
            conditions.add("id IN (SELECT illness_id FROM illness_treatments WHERE med_id = ?)");
        }
        if (isChronic != null) {
            conditions.add("is_chronic = ?");
        }

        return conditions.toArray(new String[conditions.size()]);
    }

    public Object[] filterValues(String name, int medId, Boolean isChronic) {
        List<Object> values = new ArrayList<>();

        if(name != null && !name.isBlank()) {
            values.add("%" + name + "%");
        }
        if (medId != -1) {
            values.add(medId);
        }
        if (isChronic != null) {
            values.add(isChronic.booleanValue());
        }

        return values.toArray();
    }
}
