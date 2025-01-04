package pharmacy.services;

import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.MedicalConstraint;

public class MedicalConstraintService extends Service {
    public MedicalConstraintService() throws Exception {
        super();
    }

    private void populateList(List<MedicalConstraint> labList, List<Object> objList) {
        for (int i = 0; i < objList.size(); i++) {
            labList.add((MedicalConstraint) objList.get(i));
        }
    }

    public List<MedicalConstraint> getAll() throws Exception {
        List<MedicalConstraint> results = new ArrayList<>();

        List<Object> objectList = this.getQueryManager().find(null, MedicalConstraint.class, null, null, null);
        populateList(results, objectList);

        return results;
    }
}
