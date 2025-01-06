package pharmacy.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import custom.orm.db.utils.DBConnector;
import pharmacy.dto.StockDosageDTO;
import pharmacy.entities.MedicineTransaction;
import pharmacy.entities.MedicinesDosage;

public class MedicineTransactionService extends Service {

    MedicineDosageService mds;

    public MedicineTransactionService() throws Exception {
        super();
        this.mds = new MedicineDosageService();
    }

    public MedicineTransaction insert(MedicineTransaction mt) throws Exception {
        Object o = this.getQueryManager().insert(mt, null);
        return (MedicineTransaction) o;
    }

    public void buy(int medDosageId, int quantite, LocalDateTime daty) throws Exception {
        MedicinesDosage md = mds.findById(medDosageId);
        MedicineTransaction mt = new MedicineTransaction(medDosageId, daty, quantite, 0, md.getPrice());
        insert(mt);
    }

    public void sell(int medDosageId, int quantite, LocalDateTime daty) throws Exception {
        MedicinesDosage md = mds.findById(medDosageId);
        MedicineTransaction mt = new MedicineTransaction(medDosageId, daty, 0, quantite, md.getPrice());
        insert(mt);
    }

    private void populateList(List<MedicineTransaction> transactions, List<Object> objList) {
        for (Object object : objList) {
            transactions.add((MedicineTransaction) object);
        }
    }

    public List<MedicineTransaction> getAll(int idMedDosage) throws Exception {
        List<MedicineTransaction> transactions = new ArrayList<>();

        String[] conditions = new String[] { "med_dosage_id = ?" };
        Object[] values = new Object[] { idMedDosage };
        String[] order = new String[] { "ORDER BY transaction_date DESC" };

        List<Object> objList = this.getQueryManager().find(null, MedicineTransaction.class, conditions, values, order);
        populateList(transactions, objList);

        return transactions;
    }

    public List<StockDosageDTO> getStocks() throws Exception {
        List<StockDosageDTO> results = new ArrayList<>();

        String sql = "SELECT med_dosage_id, quantity FROM v_stocks_dosages";

        Connection c = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            c = new DBConnector(DBConnector.PROPERTIES_PATH).getConnection();
            pst = c.prepareStatement(sql);

            rs = pst.executeQuery();
            while (rs.next()) {
                int mdId = rs.getInt("med_dosage_id");
                int q = rs.getInt("quantity");

                MedicinesDosage md = mds.findById(mdId);

                String displayName = mds.getDisplayName(md);

                StockDosageDTO stock = new StockDosageDTO(mdId, q, displayName);
                results.add(stock);
            }
        } catch (Exception e) {
            throw new Exception("Error during getStocks", e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return results;
    }

}
