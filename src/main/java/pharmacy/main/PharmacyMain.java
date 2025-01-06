package pharmacy.main;


import java.util.List;
import java.util.Map;

import pharmacy.entities.*;
import pharmacy.services.*;

public class PharmacyMain {
    public static void main(String[] args) {

        try {
            MedicineService ms = new MedicineService();
            Medicine m = ms.findById(1);

            Map<MedicinesFormat, List<MedicinesDosage>> formatsDosages = ms.getAllFormatsDosages(m);
            for(Map.Entry<MedicinesFormat, List<MedicinesDosage>> entry : formatsDosages.entrySet()) {
                System.out.println(entry.getKey() + " => " + entry.getValue().size());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
