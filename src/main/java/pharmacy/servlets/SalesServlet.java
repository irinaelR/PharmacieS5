package pharmacy.servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.Client;
import pharmacy.entities.Sales;
import pharmacy.services.ClientService;
import pharmacy.services.SalesService;

public class SalesServlet extends HttpServlet {

    ClientService clientService;
    SalesService salesService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            List<Client> clients = this.clientService.getAll();
            req.setAttribute("clients", clients);
            RequestDispatcher dispatcher = req.getRequestDispatcher("new-vente.jsp");
            dispatcher.forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            Date date_sales = Date.valueOf(req.getParameter("date_sales"));

            int id_client = Integer.valueOf(req.getParameter("id_client"));

            Sales sales = new Sales(date_sales,id_client);
            req.setAttribute("sales", sales);
            this.salesService.insert(sales);

            resp.sendRedirect("sales-details?sales_id ="+sales.getId());

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.salesService = new SalesService();
            this.clientService = new ClientService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}
