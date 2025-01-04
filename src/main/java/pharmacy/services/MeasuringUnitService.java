package pharmacy.services;

import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.MeasuringUnit;

public class MeasuringUnitService extends Service {
    public MeasuringUnitService() throws Exception {
        super();
    }

    private void populateList(List<MeasuringUnit> labList, List<Object> objList) {
        for (int i = 0; i < objList.size(); i++) {
            labList.add((MeasuringUnit) objList.get(i));
        }
    }

    public List<MeasuringUnit> getAll() throws Exception {
        List<MeasuringUnit> results = new ArrayList<>();

        List<Object> objectList = this.getQueryManager().find(null, MeasuringUnit.class, null, null, null);
        populateList(results, objectList);

        return results;
    }
}
