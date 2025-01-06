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

            List<MedicinesFormat> medFormat = ms.getAllFormats(m);

            Map<MedicinesFormat,List<MedicinesDosage>> medDosage = ms.getAllFormatsDosages(m);

            for(MedicinesFormat medForm:medFormat) 
            {
                List<MedicinesDosage> medDos = (List<MedicinesDosage>) medDosage.get(medFormat);
                if(medDos == null) {
                    System.out.println("null");
                } else {
                    System.out.println("not null");
                }

            }

            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
