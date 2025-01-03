package pharmacy.main;

import java.util.List;

import pharmacy.entities.*;
import pharmacy.services.*;

public class PharmacyMain {
    public static void main(String[] args) {

        try {
            IllnessService illnessService = new IllnessService();
            List<Illness> illnesses = illnessService.getAll(0, 5);
            
            for(Illness i : illnesses) {
                System.out.println(i.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
