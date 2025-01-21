package pharmacy.services;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import pharmacy.entities.Sales;
import pharmacy.entities.SalesDetails;

public class SalesService extends Service {

    public SalesService() throws Exception {
        super();
    }
    
    private void populateList(List<Sales> labList, List<Object> objList) throws Exception {
        for (int i = 0; i < objList.size(); i++) {
            Sales s = (Sales) objList.get(i);
            s.setDetails(null);
            labList.add(s);
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

    public String[] filterConditions(String med_form_id,String age_group, String empId, String dateMin, String dateMax) {
        List<String> conditionsList = new ArrayList<>();
        if (med_form_id != null && !med_form_id.isBlank() && !med_form_id.equals("-1")) {
            conditionsList.add("id IN (SELECT id_sales FROM sales_details WHERE id_med_dosage IN (SELECT id from medicines_dosages where med_format_id IN (SELECT id FROM medicines_formats WHERE form_id = ?)))");
        }
        if (age_group != null && !age_group.isBlank() && !age_group.equals("-1")) {
            conditionsList.add("id IN (SELECT id_sales FROM sales_details WHERE id_med_dosage IN (SELECT id_med_dosage from med_age_group where id_age_group = ?))");
        }
        if (empId != null && !empId.isBlank() && !empId.equals("-1")) {
            conditionsList.add("employee_id = ?");
        }
        if (dateMin != null && !dateMin.isBlank()) {
            conditionsList.add("date_sales >= ?");
        }
        if (dateMax != null && !dateMax.isBlank()) {
            conditionsList.add("date_sales <= ?");
        }

        return conditionsList.toArray(new String[conditionsList.size()]);
    }

    public Object[] filterValues(String med_form_id, String age_group, String empId, String dateMin, String dateMax) {
        List<Object> valuesList = new ArrayList<>();
        if (med_form_id != null && !med_form_id.isBlank() && !med_form_id.equals("-1")) {
            valuesList.add(Integer.valueOf(med_form_id));
        }
        if (age_group != null && !age_group.isBlank() && !age_group.equals("-1")) {
            valuesList.add(Integer.valueOf(age_group));
        }
        if (empId != null && !empId.isBlank() && !empId.equals("-1")) {
            valuesList.add(Integer.valueOf(empId));
        }
        if (dateMin != null && !dateMin.isBlank()) {
            valuesList.add(Date.valueOf(dateMin));
        }
        if (dateMax != null && !dateMax.isBlank()) {
            valuesList.add(Date.valueOf(dateMax));
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

    public double getTotalSale(List<SalesDetails> details) {
        double total = 0;

        for (SalesDetails sd : details) {
            total += (sd.getUnitPrice() * sd.getQuantity());
        }

        return total;
    }

    public double getTotalCommission(Sales s) {
        List<SalesDetails> details = s.getDetails();
        double totalValue = getTotalSale(details);
        return totalValue * s.getCommission() / 100;
    }

}
