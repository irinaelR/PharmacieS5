package pharmacy.services;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.Client;
import pharmacy.entities.Medicine;

public class ClientService extends Service{

    public ClientService() throws Exception {
        super();
    }

    private void populateList(List<Client> labList, List<Object> objList) {
        for (int i = 0; i < objList.size(); i++) {
            labList.add((Client) objList.get(i));
        }
    }

    public List<Client> getAll() throws Exception {
        List<Client> results = new ArrayList<>();

        List<Object> objectList = this.getQueryManager().find(null, Client.class, null, null, null);
        populateList(results, objectList);

        return results;
    }

    public List<Client> getAll(String[] conditions, Object[] values, String[] afterWhere) throws Exception {
        List<Client> results = new ArrayList<>();

        List<Object> objectList = this.getQueryManager().find(null, Client.class, conditions, values, afterWhere);
        populateList(results, objectList);

        return results;
    }

    public Client findById(int id) throws Exception {
        Client m = new Client();
        m.setId(id);

        Object result = this.getQueryManager().findById(null, m);
        if (result != null) {
            m = (Client) result;
        } else {
            m = null;
        }

        return m;
    }

    public String[] filterConditions(String dateAchat) {
        List<String> conditions = new ArrayList<>();
        if (dateAchat != null && !dateAchat.isBlank()) {
            conditions.add("id IN (SELECT id_client FROM sales WHERE date_sales = ?)");
        }

        return conditions.toArray(new String[conditions.size()]);
    }

    public Object[] filterValues(String dateAchat) {
        List<Object> values = new ArrayList<>();

        if(dateAchat != null && !dateAchat.isBlank()) {
            values.add(Date.valueOf(dateAchat));
        }

        return values.toArray();
    }
}
    

