package pharmacy.services;

import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.MedicinesRestriction;

public class MedicinesRestrictionService extends Service {

    public MedicinesRestrictionService() throws Exception {
        super();
    }

    private void populateList(List<MedicinesRestriction> restrictions, List<Object> objects) {
        for (Object object : objects) {
            restrictions.add((MedicinesRestriction) object);
        }
    }

    public List<MedicinesRestriction> findByMedId(int medId) throws Exception {
        String[] conditions = new String[] { "med_id = ?" };
        Object[] values = new Object[] { medId };

        List<MedicinesRestriction> restrictions = new ArrayList<>();
        List<Object> results = this.getQueryManager().find(null, MedicinesRestriction.class, conditions, values, null);
        populateList(restrictions, results);

        return restrictions;
    }

    public MedicinesRestriction insert(MedicinesRestriction restriction) throws Exception {
        Object o = this.getQueryManager().insert(restriction, null);
        return (MedicinesRestriction) o;
    }
    
}
