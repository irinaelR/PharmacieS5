package pharmacy.main;

import java.util.List;

import pharmacy.entities.*;
import pharmacy.services.*;

public class PharmacyMain {
    public static void main(String[] args) {

        try {
            MedicineService medicineService = new MedicineService();
            List<Medicine> meds = medicineService.getAll(0, 10);

            for (Medicine medicine : meds) {
                System.out.println(medicine.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
