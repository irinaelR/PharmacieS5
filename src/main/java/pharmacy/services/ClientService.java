package pharmacy.services;

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
}
    

