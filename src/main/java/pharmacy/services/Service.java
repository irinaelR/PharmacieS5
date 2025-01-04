package pharmacy.services;

import custom.orm.db.QueryManager;

public class Service {
    private QueryManager queryManager;

    public QueryManager getQueryManager() {
        return queryManager;
    }

    public void setQueryManager(QueryManager queryManager) {
        this.queryManager = queryManager;
    }

    public Service() throws Exception {
        this.setQueryManager(new QueryManager());
    }
}
