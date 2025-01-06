package pharmacy.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import custom.orm.db.utils.DBConnector;
import jakarta.servlet.ServletException;
import pharmacy.entities.MedicalConstraint;
import pharmacy.entities.MedicinesRestriction;

public class MedicalConstraintService extends Service {
    MedicinesRestrictionService medicinesRestrictionService;

    public MedicalConstraintService() throws Exception {
        super();
        this.medicinesRestrictionService = new MedicinesRestrictionService();
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

    public MedicalConstraint findById(int id) throws Exception {
        Object o = this.getQueryManager().findById(null, new MedicalConstraint(id, null));
        return (MedicalConstraint) o;
    }

    public List<MedicalConstraint> getAll(int medId) throws Exception {
        List<MedicalConstraint> results = new ArrayList<>();

        List<MedicinesRestriction> restrictions = medicinesRestrictionService.findByMedId(medId);
        for (MedicinesRestriction medicinesRestriction : restrictions) {
            results.add(findById(medicinesRestriction.getConstraintId()));
        }

        return results;
    }
}
