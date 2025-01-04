package pharmacy.services;

import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.MedCategory;

public class MedCategoryService extends Service {
    public MedCategoryService() throws Exception {
        super();
    }

    private void populateList(List<MedCategory> labList, List<Object> objList) {
        for (int i = 0; i < objList.size(); i++) {
            labList.add((MedCategory) objList.get(i));
        }
    }

    public List<MedCategory> getAll() throws Exception {
        List<MedCategory> results = new ArrayList<>();

        List<Object> objectList = this.getQueryManager().find(null, MedCategory.class, null, null, null);
        populateList(results, objectList);

        return results;
    }
}
