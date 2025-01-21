package pharmacy.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.*;
import pharmacy.services.AgeGroupService;
import pharmacy.services.MedFormService;
import pharmacy.services.SalesService;

public class SalesListServlet extends HttpServlet {
    private SalesService ss;
    private MedFormService mfs;
    private AgeGroupService ags;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            List<MedForm> medForms = this.mfs.getAll();
            req.setAttribute("medForms", medForms);

            List<AgeGroup> ageGroups = this.ags.getAll();
            req.setAttribute("ageGroups", ageGroups);

            String form_med_id = req.getParameter("form_med_id");
            String age_categ_id = req.getParameter("age_categ_id");

            String[] conditions = ss.filterConditions(form_med_id,age_categ_id, null, null, null);
            Object[] values = ss.filterValues(form_med_id,age_categ_id, null, null, null);

            List<Sales> sales = ss.getAll(conditions, values, null);
            req.setAttribute("sales", sales);

            RequestDispatcher dispatcher = req.getRequestDispatcher("list-vente.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.ags = new AgeGroupService();
            this.ss = new SalesService();
            this.mfs = new MedFormService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}
