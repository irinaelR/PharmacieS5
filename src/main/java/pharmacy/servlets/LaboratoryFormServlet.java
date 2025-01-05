package pharmacy.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.Illness;
import pharmacy.entities.LabType;
import pharmacy.entities.Laboratory;
import pharmacy.services.LabTypeService;
import pharmacy.services.LaboratoryService;

public class LaboratoryFormServlet extends HttpServlet {
    private LaboratoryService laboratoryService;
    private LabTypeService labTypeService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<LabType> categories = labTypeService.getAll();
            req.setAttribute("categories", categories);

            String idStr = req.getParameter("id");
            if (idStr != null && !idStr.isBlank()) {
                int id = Integer.valueOf(idStr);
                Laboratory l = laboratoryService.findById(id);
                req.setAttribute("laboratory", l);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("new-laboratory.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.labTypeService = new LabTypeService();
            this.laboratoryService = new LaboratoryService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
