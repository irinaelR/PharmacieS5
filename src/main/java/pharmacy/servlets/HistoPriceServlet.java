package pharmacy.servlets;

import java.io.IOException;
import java.sql.Date;
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

public class HistoPriceServlet extends HttpServlet {

    private List<MedicinesDosage> dosages;
    private MedicineDosageService medicineDosageService;
    private HistoPriceService histoPriceService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            if (dosages == null) {
                initDosages();
            }
            req.setAttribute("medDosage", dosages);

        } catch (Exception e) {
            throw new ServletException(e);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("new-pricing.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int medDosageId = Integer.valueOf(req.getParameter("medDosage"));
        Date datePrice = Date.valueOf(req.getParameter("datePricing"));
        double price = Double.valueOf(req.getParameter("price"));

        HistoPrice histoPrice = new HistoPrice(medDosageId, datePrice, price);
        try {
            histoPrice = histoPriceService.insert(histoPrice);
        } catch (Exception e) {
            throw new ServletException(e);
        }

        resp.sendRedirect("pricing");
    }

    @Override
    public void init() throws ServletException {
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
