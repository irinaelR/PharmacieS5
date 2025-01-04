package pharmacy.main;


import pharmacy.entities.*;
import pharmacy.services.*;

public class PharmacyMain {
    public static void main(String[] args) {

        try {
            MedicineService ms = new MedicineService();
            Medicine m = ms.findById(10);
            System.out.println(m.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
