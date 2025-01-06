package pharmacy.servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.services.MedicineTransactionService;

public class TransactionServlet extends HttpServlet {

    MedicineTransactionService medicineTransactionService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String transactionType = req.getParameter("transactionType");
        String medDosageId = req.getParameter("medDosageId");
        String quantity = req.getParameter("quantity");
        String daty = req.getParameter("dateTransact");

        try {
            if (transactionType != null) {
                switch (transactionType) {
                    case "sell":
                        medicineTransactionService.sell(Integer.valueOf(medDosageId), Integer.valueOf(quantity), LocalDateTime.parse(daty));
                        break;
                
                    case "buy":
                        medicineTransactionService.buy(Integer.valueOf(medDosageId), Integer.valueOf(quantity), LocalDateTime.parse(daty));
                        break;
                    
                    default:
                        break;
                }
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        resp.sendRedirect("/");

    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.medicineTransactionService = new MedicineTransactionService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}
