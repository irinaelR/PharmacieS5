package pharmacy.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.HistoPrice;
import pharmacy.entities.MedicinesDosage;
import pharmacy.services.HistoPriceService;
import pharmacy.services.MedicineDosageService;

public class HistoPriceListServlet extends HttpServlet {

    private HistoPriceService histoPriceService;
    private MedicineDosageService medicineDosageService;
    private List<MedicinesDosage> dosages;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (this.dosages == null) {
                initDosages();
            }
            req.setAttribute("medDosage", this.dosages);

            String dateMin = req.getParameter("dateMin");
            String dateMax = req.getParameter("dateMax");
            String medDosage = req.getParameter("medicine");

            List<HistoPrice> prices = histoPriceService.search(medDosage, dateMin, dateMax);
            req.setAttribute("histoPrice", prices);
        } catch (Exception e) {
            throw new ServletException(e);
        }
        
        RequestDispatcher dispatcher = req.getRequestDispatcher("list-product-price.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    public void init() throws ServletException {
        // TODO Auto-generated method stub
        super.init();
        try {
            this.histoPriceService = new HistoPriceService();
            this.medicineDosageService = new MedicineDosageService();
            initDosages();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void initDosages() throws Exception {
        this.dosages = medicineDosageService.getAll(null, null, null);
        for (MedicinesDosage medicinesDosage : dosages) {
            medicinesDosage.setDisplayName(medicineDosageService.getDisplayName(medicinesDosage));
        }
    }
    
}
