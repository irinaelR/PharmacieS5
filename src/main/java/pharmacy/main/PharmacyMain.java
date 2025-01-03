package pharmacy.main;

import java.util.List;

import pharmacy.entities.Laboratory;
import pharmacy.services.LaboratoryService;

public class PharmacyMain {
    public static void main(String[] args) {

        try {
            LaboratoryService laboratoryService = new LaboratoryService();
            List<Laboratory> labs = laboratoryService.getAll(5, 5);

            for (Laboratory laboratory : labs) {
                System.out.println(laboratory.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
