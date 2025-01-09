package pharmacy.services;

import java.util.ArrayList;
import java.util.List;
import pharmacy.entities.Sales;

public class SalesService extends Service {

    public SalesService() throws Exception {
        super();
    }
    
    private void populateList(List<Sales> labList, List<Object> objList) {
        for (int i = 0; i < objList.size(); i++) {
            labList.add((Sales) objList.get(i));
        }
    }

    public List<Sales> getAll(String[] conditions, Object[] values, String[] afterWhere) throws Exception {
        List<Sales> results = new ArrayList<>();

        List<Object> obj = this.getQueryManager().find(null, Sales.class, conditions, values, afterWhere);
        populateList(results, obj);

        return results;
    }

    public Sales insert(Sales m) throws Exception {
        Object o = this.getQueryManager().insert(m, null);
        Sales result = new Sales();

        result = (o != null) ? (Sales) o : null;
        return result;
    }

    public String[] filterConditions(String med_form_id,String age_group) {
        List<String> conditionsList = new ArrayList<>();
        if (med_form_id != null && !med_form_id.isBlank() && !med_form_id.equals("-1")) {
            conditionsList.add(" AND id IN (SELECT id_sales FROM sales_details WHERE id_med_dosage IN (SELECT id from medicines_dosages where med_format_id IN (SELECT id FROM medicines_formats WHERE form_id = ?)))");
        }
        if (age_group != null && !age_group.isBlank() && !age_group.equals("-1")) {
            conditionsList.add(" AND id IN (SELECT id_sales FROM sales_details WHERE id_med_dosage IN (SELECT id_med_dosage from med_age_group where id_age_group = ?))");
        }

        return conditionsList.toArray(new String[conditionsList.size()]);
    }

    public Object[] filterValues(String med_form_id, String age_group) {
        List<Object> valuesList = new ArrayList<>();
        if (med_form_id != null && !med_form_id.isBlank() && !med_form_id.equals("-1")) {
            valuesList.add(Integer.valueOf(med_form_id));
        }
        if (age_group != null && !age_group.isBlank() && !age_group.equals("-1")) {
            valuesList.add(Integer.valueOf(age_group));
        }

        return valuesList.toArray();
    }

    public Sales findById(int id) throws Exception {
        Sales m = new Sales();
        m.setId(id);

        Object result = this.getQueryManager().findById(null, m);
        if (result != null) {
            m = (Sales) result;
        } else {
            m = null;
        }

        return m;
    }

}
