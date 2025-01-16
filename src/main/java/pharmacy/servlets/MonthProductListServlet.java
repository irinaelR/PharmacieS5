package pharmacy.servlets;

import java.io.IOException;
import java.time.YearMonth;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.Medicine;
import pharmacy.services.MedicineService;

public class MonthProductListServlet extends HttpServlet {

    private MedicineService medicineService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String yearParam = req.getParameter("year");
        String monthParam = req.getParameter("month");
        if ((monthParam == null || monthParam.isBlank()) && yearParam == null) {
            YearMonth ym = YearMonth.now();
            monthParam = ym.toString();
        } 


        String[] conditions = medicineService.filterConditions(null, null, null, null, null, null, null, null, monthParam, yearParam);
        Object[] values = medicineService.filterValues(null, null, null, null, null, null, null, null, monthParam, yearParam);

        try {
            List<Medicine> medicines = medicineService.getAll(conditions, values, null);
            req.setAttribute("medicines", medicines);

            req.setAttribute("ymString", monthParam);
        } catch(Exception e) {
            throw new ServletException(e);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("list-product-month.jsp");
        dispatcher.forward(req, resp);

    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            medicineService = new MedicineService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}
