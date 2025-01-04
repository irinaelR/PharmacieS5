package pharmacy.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.Illness;
import pharmacy.services.IllnessService;
import pharmacy.services.MedicineService;

@WebServlet("/illnesses")
public class IllnessServlet extends HttpServlet {

    private IllnessService illnessService;
    private MedicineService medicineService;
    private int resultsNb;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        int medId = -1;
        String isChronic = req.getParameter("isChronic");
        Boolean isChronicBool = null;
        if (isChronic != null) {
            isChronicBool = true;
        }

        String[] conditions = illnessService.filterConditions(name, medId, isChronicBool);
        Object[] values = illnessService.filterValues(name, medId, isChronicBool);

        try {

            String illId = req.getParameter("illnessId");
            String action = req.getParameter("action");
            if (illId != null && action != null && action.equalsIgnoreCase("del")) {
                int id = Integer.valueOf(illId);
                Illness i = illnessService.findById(id);
                boolean wasDeleted = illnessService.delete(i);
                req.setAttribute("deleteSuccess", wasDeleted);
            }

            List<Illness> illnesses = illnessService.getAll(conditions, values, null);
            req.setAttribute("illnesses", illnesses);

            // List<MedicineSimple> medsList = medicineService.getAllSimple();
            // req.setAttribute("medicines", medsList);

            RequestDispatcher dispatcher = req.getRequestDispatcher("list-illness.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.illnessService = new IllnessService();
            this.medicineService = new MedicineService();
            this.resultsNb = Integer.valueOf(this.getServletContext().getInitParameter("resultsNb"));

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

}
