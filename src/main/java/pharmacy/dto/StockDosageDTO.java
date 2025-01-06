package pharmacy.dto;

import pharmacy.entities.MedicinesDosage;
import pharmacy.services.MedicineDosageService;

public class StockDosageDTO {

    int medDosageId;
    MedicinesDosage medDosage;

    int quantity;

    String displayName;

    public StockDosageDTO(int medDosageId, int quantity, String displayName) throws Exception {
        this.setMedDosageId(medDosageId);
        this.quantity = quantity;
        this.displayName = displayName;
    }

    public StockDosageDTO() {
    }

    public int getMedDosageId() {
        return medDosageId;
    }

    public void setMedDosageId(int medDosageId) throws Exception {
        this.medDosageId = medDosageId;

        MedicineDosageService mds = new MedicineDosageService();
        this.setMedDosage(mds.findById(medDosageId));
    }

    public MedicinesDosage getMedDosage() {
        return medDosage;
    }

    public void setMedDosage(MedicinesDosage medDosage) {
        this.medDosage = medDosage;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }
}
