package pharmacy.servlets;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.Employee;
import pharmacy.entities.Gender;
import pharmacy.services.EmployeeService;

public class CommissionsServlet extends HttpServlet {

    private EmployeeService employeeService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String dateMin = req.getParameter("minDate");
            String dateMax = req.getParameter("maxDate");
            Map<Employee, Double[]> commissions = employeeService.getCommissionsPerEmp(dateMin, dateMax);
            req.setAttribute("commissions", commissions);
            Map<Gender, Double[]> genderedComs = employeeService.getCommissionsPerGender(dateMin, dateMax);
            req.setAttribute("genderedComs", genderedComs);
        } catch (Exception e) {
            throw new ServletException(e);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("list-commi.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.employeeService = new EmployeeService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}
