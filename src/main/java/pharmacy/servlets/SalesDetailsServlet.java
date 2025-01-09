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
import pharmacy.entities.MedicinesDosage;
import pharmacy.entities.Sales;
import pharmacy.entities.SalesDetails;
import pharmacy.services.ClientService;
import pharmacy.services.MedicineDosageService;
import pharmacy.services.SalesDetailsService;
import pharmacy.services.SalesService;

public class SalesDetailsServlet extends HttpServlet {

    ClientService clientService;
    SalesService salesService;
    SalesDetailsService sds;
    MedicineDosageService mds;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            Sales sales = this.salesService.findById(Integer.valueOf(req.getParameter("sales_id")));
            System.out.println(sales.getId());
            req.setAttribute("sales", sales);
            List<MedicinesDosage> med_dosages = this.mds.getAll(null,null,null);
            req.setAttribute("med_dosages", med_dosages);
            List<String> names = new ArrayList<>();
            for (MedicinesDosage md : med_dosages) {
                names.add(mds.getDisplayName(md));
            }
            req.setAttribute("medsNames", names);
            RequestDispatcher dispatcher = req.getRequestDispatcher("vente-details.jsp");
            dispatcher.forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            int id_sales = Integer.parseInt(req.getParameter("id_sales"));
            int id_med_dosage = Integer.parseInt(req.getParameter("id_med_dosage"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            double unit_price = this.mds.findById(id_med_dosage).getPrice();

            SalesDetails sd = new SalesDetails(id_sales,id_med_dosage,quantity,unit_price);

            this.sds.insert(sd);

            resp.sendRedirect("sales-list");

        } catch (Exception e) {
            throw new ServletException(e);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("sell-medicine.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.mds = new MedicineDosageService();
            this.sds = new SalesDetailsService();
            this.salesService = new SalesService();
            this.clientService = new ClientService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}
