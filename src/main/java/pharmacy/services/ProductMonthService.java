package pharmacy.services;

import pharmacy.entities.ProductMonth;

public class ProductMonthService extends Service {

    public ProductMonthService() throws Exception {
        super();
    }

    public ProductMonth insert(ProductMonth pm) throws Exception {
        Object o = this.getQueryManager().insert(pm, null);
        return (ProductMonth) o;
    }
    
}
