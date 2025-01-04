package pharmacy.services;

import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.LabType;

public class LabTypeService extends Service {
    public LabTypeService() throws Exception {
        super();
    }

    private void populateList(List<LabType> labList, List<Object> objList) {
        for (int i = 0; i < objList.size(); i++) {
            labList.add((LabType) objList.get(i));
        }
    }

    public List<LabType> getAll() throws Exception {
        List<LabType> results = new ArrayList<>();

        List<Object> objectList = this.getQueryManager().find(null, LabType.class, null, null, null);
        populateList(results, objectList);

        return results;
    }
}
