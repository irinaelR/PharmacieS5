package pharmacy.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
// import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.LabType;
import pharmacy.entities.Laboratory;
import pharmacy.services.LabTypeService;
import pharmacy.services.LaboratoryService;

// @WebServlet("laboratories")
public class LaboratoryServlet extends HttpServlet {
    private LaboratoryService laboratoryService;
    private LabTypeService labTypeService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String[] conditions = null;
            Object[] values = null;

            String categ = req.getParameter("category");
            if (categ != null) {
                int categId = Integer.valueOf(categ);
                if (categId != -1) {
                    conditions = new String[] { "type_id = ?" };
                    values = new Object[] { categId };
                }
            }

            String labIdStr = req.getParameter("labId");
            String action = req.getParameter("action");
            if (labIdStr != null && action != null && action.equalsIgnoreCase("del")) {
                int labId = Integer.valueOf(labIdStr);
                Laboratory l = laboratoryService.findById(labId);
                boolean wasDeleted = laboratoryService.delete(l);
                req.setAttribute("deleteSuccess", wasDeleted);
            }

            List<LabType> labtypes = labTypeService.getAll();
            req.setAttribute("labTypes", labtypes);

            List<Laboratory> labs = laboratoryService.getAll(conditions, values, null);
            req.setAttribute("labs", labs);

            RequestDispatcher dispatcher = req.getRequestDispatcher("list-laboratory.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.laboratoryService = new LaboratoryService();
            this.labTypeService = new LabTypeService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}
