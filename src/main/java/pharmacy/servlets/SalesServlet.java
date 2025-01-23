package pharmacy.servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.Client;
import pharmacy.entities.Employee;
import pharmacy.entities.Sales;
import pharmacy.services.ClientService;
import pharmacy.services.EmployeeService;
import pharmacy.services.SalesService;

public class SalesServlet extends HttpServlet {

    ClientService clientService;
    SalesService salesService;
    EmployeeService employeeService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            List<Client> clients = this.clientService.getAll();
            req.setAttribute("clients", clients);

            List<Employee> employees = this.employeeService.getAll(null, null, null);
            req.setAttribute("employees", employees);

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

            // double commission = Double.valueOf(req.getParameter("commission"));

            int idEmp = Integer.valueOf(req.getParameter("employee"));

            Sales sales = new Sales(date_sales,id_client);
            sales.setCommission(5);
            sales.setEmpId(idEmp);

            sales = this.salesService.insert(sales);

            req.setAttribute("sales", sales);

            resp.sendRedirect("sales-details?sales_id="+sales.getId());

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
            this.employeeService = new EmployeeService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}
