package pharmacy.main;


import java.util.List;

import pharmacy.entities.*;
import pharmacy.services.*;

public class PharmacyMain {
    public static void main(String[] args) {

        try {
            MedicineService ms = new MedicineService();
            Medicine m1 = ms.findById(1);
            List<MedicinesFormat> formats = ms.getAllFormats(m1);
            for (MedicinesFormat medicinesFormat : formats) {
                System.out.println(medicinesFormat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
