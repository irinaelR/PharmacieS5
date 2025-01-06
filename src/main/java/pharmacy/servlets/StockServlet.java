package pharmacy.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.dto.StockDosageDTO;
import pharmacy.services.MedicineTransactionService;

public class StockServlet extends HttpServlet {

    MedicineTransactionService transactionService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<StockDosageDTO> stocks = transactionService.getStocks();
            req.setAttribute("stocks", stocks);
        } catch (Exception e) {
            throw new ServletException(e);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("remaining-quantity.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.transactionService = new MedicineTransactionService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}
