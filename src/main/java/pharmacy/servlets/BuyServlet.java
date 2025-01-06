package pharmacy.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.MedicinesDosage;
import pharmacy.services.MedicineDosageService;

public class BuyServlet extends HttpServlet {
    MedicineDosageService medicineDosageService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<MedicinesDosage> dosages = medicineDosageService.getAll(null, null, null);
            req.setAttribute("dosages", dosages);
            
            List<String> names = new ArrayList<>();
            for (MedicinesDosage md : dosages) {
                names.add(medicineDosageService.getDisplayName(md));
            }
            req.setAttribute("medsNames", names);
        } catch (Exception e) {
            throw new ServletException(e);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("buy-medicine.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.medicineDosageService = new MedicineDosageService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
