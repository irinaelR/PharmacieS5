package pharmacy.services;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import pharmacy.entities.HistoPrice;

public class HistoPriceService extends Service {

    private MedicineDosageService medicineDosageService;

    public HistoPriceService() throws Exception {
        super();
        this.medicineDosageService = new MedicineDosageService();
    }

    public HistoPrice insert(HistoPrice hp) throws Exception {
        Object res = this.getQueryManager().insert(hp, null);
        return (res != null) ? (HistoPrice) res : null;
    }
    
    public String[] filterConditions(String medDosageId, String dateMin, String dateMax) {
        List<String> conditionsList = new ArrayList<>();

        if (medDosageId != null && !medDosageId.isBlank() && !medDosageId.equals("-1")) {
            conditionsList.add("med_dosage_id = ?");
        }
        if (dateMin != null && !dateMin.isBlank()) {
            conditionsList.add("date_start >= ?");
        }
        if (dateMax != null && !dateMax.isBlank()) {
            conditionsList.add("date_start <= ?");
        }

        return conditionsList.toArray(new String[conditionsList.size()]);
    }

    public Object[] filterValues(String medDosageId, String dateMin, String dateMax) {
        List<Object> valuesList = new ArrayList<>();

        if (medDosageId != null && !medDosageId.isBlank() && !medDosageId.equals("-1")) {
            valuesList.add(Integer.valueOf(medDosageId));
        }
        if (dateMin != null && !dateMin.isBlank()) {
            valuesList.add(Date.valueOf(dateMin));
        }
        if (dateMax != null && !dateMax.isBlank()) {
            valuesList.add(Date.valueOf(dateMax));
        }

        return valuesList.toArray();
    }

    private void populateList(List<HistoPrice> prices, List<Object> objects) {
        for (Object object : objects) {
            prices.add((HistoPrice) object);
        }
    }

    public List<HistoPrice> getAll(String[] conditions, Object[] values, String[] afterWhere) throws Exception {
        List<HistoPrice> results = new ArrayList<>();

        List<Object> objects = this.getQueryManager().find(null, HistoPrice.class, conditions, values, afterWhere);
        populateList(results, objects);

        return results;
    }

    public List<HistoPrice> search(String medDosageId, String dateMin, String dateMax) throws Exception {
        String[] afterWhere = new String[] { "ORDER BY date_start DESC" };
        String[] conditions = filterConditions(medDosageId, dateMin, dateMax);
        Object[] values = filterValues(medDosageId, dateMin, dateMax);

        return getAll(conditions, values, afterWhere);
    }
}
