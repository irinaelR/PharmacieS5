package pharmacy.services;

import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.MedForm;

public class MedFormService extends Service {
    public MedFormService() throws Exception {
        super();
    }

    private void populateList(List<MedForm> labList, List<Object> objList) {
        for (int i = 0; i < objList.size(); i++) {
            labList.add((MedForm) objList.get(i));
        }
    }

    public List<MedForm> getAll() throws Exception {
        List<MedForm> results = new ArrayList<>();

        List<Object> objectList = this.getQueryManager().find(null, MedForm.class, null, null, null);
        populateList(results, objectList);

        return results;
    }
}
