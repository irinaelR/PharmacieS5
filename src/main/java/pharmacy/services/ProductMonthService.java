package pharmacy.services;

import java.util.List;

import pharmacy.entities.ProductMonth;

public class ProductMonthService extends Service {

    public ProductMonthService() throws Exception {
        super();
    }

    public ProductMonth insert(ProductMonth pm) throws Exception {
        Object o = this.getQueryManager().insert(pm, null);
        return (ProductMonth) o;
    }

    public ProductMonth getByMedId(int id) throws Exception {
        String[] conditions = new String[] { "id_medicine = ?" };
        Object[] values = new Object[] { id };

        List<Object> objList = this.getQueryManager().find(null, ProductMonth.class, conditions, values, null);
        if (objList.size() > 0) {
            return (ProductMonth) objList.get(0);
        }

        return null;
    }
    
}
