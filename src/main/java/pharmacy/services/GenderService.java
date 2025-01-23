package pharmacy.services;

import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.Gender;

public class GenderService extends Service {

    public GenderService() throws Exception {
        super();
    }

    private void populateList(List<Gender> genders, List<Object> objects) {
        for (Object object : objects) {
            genders.add((Gender) object);
        }
    }

    public List<Gender> getAll() throws Exception {
        List<Gender> results = new ArrayList<>();
        List<Object> objects = this.getQueryManager().find(null, Gender.class, null, null, null);
        populateList(results, objects);

        return results;
    }
    
}
