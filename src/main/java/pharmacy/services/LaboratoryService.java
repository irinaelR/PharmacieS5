package pharmacy.services;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import custom.orm.db.QueryManager;
import custom.orm.db.utils.DBConnector;
import pharmacy.entities.Laboratory;

public class LaboratoryService {

    private QueryManager queryManager;
    private Connection connection;

    public QueryManager getQueryManager() {
        return queryManager;
    }

    public void setQueryManager(QueryManager queryManager) {
        this.queryManager = queryManager;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public LaboratoryService() throws Exception {
        this.setQueryManager(new QueryManager());
        this.setConnection(
            new DBConnector(DBConnector.PROPERTIES_PATH).getConnection()
        );
    }

    public Laboratory insert(Laboratory l) throws Exception {
        Object labObj = this.getQueryManager().insert(l, connection);
        if (labObj != null) {
            return (Laboratory) labObj;
        } else {
            return null;
        }
    }

    // returns true if any row was successfully updated in the database
    // returns false otherwise
    public boolean update(Laboratory newLab) throws Exception {
        int affectedRows = this.getQueryManager().update(connection, newLab);
        return affectedRows > 0;
    }

    // returns true if any row was successfully deleted in the database
    // returns false otherwise
    public boolean delete(Laboratory l) throws Exception {
        int affectedRows = this.getQueryManager().delete(connection, l);
        return affectedRows > 0;
    }

    private void populateList(List<Laboratory> labList, List<Object> objList) {
        for (int i = 0; i < objList.size(); i++) {
            labList.add((Laboratory) objList.get(i));
        }
    }

    public List<Laboratory> getAll() throws Exception {
        List<Laboratory> results = new ArrayList<>();

        List<Object> objectList = this.getQueryManager().find(connection, Laboratory.class, null, null, null);
        populateList(results, objectList);

        return results;
    }

    public List<Laboratory> getAll(int start, int nb) throws Exception {
        List<Laboratory> results = new ArrayList<>();

        List<Object> objectList = this.getQueryManager().find(connection, Laboratory.class, null, null, null, start, nb);
        populateList(results, objectList);
        
        return results;
    }
}
