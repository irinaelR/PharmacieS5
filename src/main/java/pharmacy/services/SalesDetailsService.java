package pharmacy.services;

import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.Sales;
import pharmacy.entities.SalesDetails;

public class SalesDetailsService extends Service {

    public SalesDetailsService() throws Exception {
        super();
    }

    public SalesDetails findById(int id) throws Exception {
        SalesDetails m = new SalesDetails();
        m.setId(id);

        Object result = this.getQueryManager().findById(null, m);
        if (result != null) {
            m = (SalesDetails) result;
        } else {
            m = null;
        }

        return m;
    }

    public SalesDetails insert(SalesDetails m) throws Exception {
        Object o = this.getQueryManager().insert(m, null);
        SalesDetails result = new SalesDetails();

        result = (o != null) ? (SalesDetails) o : null;
        return result;
    }

    private void populateList(List<SalesDetails> labList, List<Object> objList) {
        for (int i = 0; i < objList.size(); i++) {
            labList.add((SalesDetails) objList.get(i));
        }
    }

    public List<SalesDetails> getAll(String[] conditions, Object[] values, String[] afterWhere) throws Exception {
        List<SalesDetails> results = new ArrayList<>();

        List<Object> obj = this.getQueryManager().find(null, SalesDetails.class, conditions, values, afterWhere);
        populateList(results, obj);

        return results;
    }

    public List<SalesDetails> getAll(Sales m) throws Exception {
        String[] conditions = new String[] {
            "id_sales = ?"
        };
        Object[] values = new Object[] {
          m.getId()  
        };

        return this.getAll(conditions, values, null);
    }
    
}
