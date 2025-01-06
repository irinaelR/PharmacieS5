package pharmacy.main;


import java.util.List;

import pharmacy.entities.*;
import pharmacy.services.*;

public class PharmacyMain {
    public static void main(String[] args) {

        try {
            MedicinesFormatService mfs = new MedicinesFormatService();

            MedicinesFormat mf = mfs.findById(1);
            List<MedicinesDosage> mdList = mfs.getAllDosages(mf);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
