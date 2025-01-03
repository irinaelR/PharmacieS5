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

    public List<Illness> getAll() throws Exception {
        List<Illness> results = new ArrayList<>();

        List<Object> objList = this.getQueryManager().find(null, Illness.class, null, null, null);
        populateList(results, objList);

        return results;
    }

    public List<Illness> getAll(int start, int nb) throws Exception {
        List<Illness> results = new ArrayList<>();

        List<Object> objList = this.getQueryManager().find(null, Illness.class, null, null, null, start, nb);
        populateList(results, objList);

        return results;
    }
}
