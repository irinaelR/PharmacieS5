package pharmacy.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.Medicine;
import pharmacy.entities.ProductMonth;
import pharmacy.services.MedicineService;
import pharmacy.services.ProductMonthService;

public class ProductMonthServlet extends HttpServlet {
    private ProductMonthService productMonthService;
    private MedicineService medicineService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Medicine> medicines = medicineService.getAll(null, null, null);
            req.setAttribute("medicines", medicines);
        } catch (Exception e) {
            throw new ServletException(e);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("insert-product-month.jsp");
        dispatcher.forward(req, resp);
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String prod = req.getParameter("product");

        String yearMonth = req.getParameter("month");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM"); 
        YearMonth ym = YearMonth.parse(yearMonth, formatter); 
        LocalDate date = ym.atDay(1);
        
        ProductMonth pm = new ProductMonth(Integer.valueOf(prod), date);
        try {
            productMonthService.insert(pm);
            resp.sendRedirect("insert-product-month");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.productMonthService = new ProductMonthService();
            this.medicineService = new MedicineService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}
