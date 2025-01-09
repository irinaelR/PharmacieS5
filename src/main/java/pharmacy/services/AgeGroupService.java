package pharmacy.services;

import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.AgeGroup;

public class AgeGroupService extends Service {

    public AgeGroupService() throws Exception {
        super();
    }

    private void populateList(List<AgeGroup> labList, List<Object> objList) {
        for (int i = 0; i < objList.size(); i++) {
            labList.add((AgeGroup) objList.get(i));
        }
    }

    public List<AgeGroup> getAll() throws Exception {
        List<AgeGroup> results = new ArrayList<>();

        List<Object> objectList = this.getQueryManager().find(null, AgeGroup.class, null, null, null);
        populateList(results, objectList);

        return results;
    }
    
}
